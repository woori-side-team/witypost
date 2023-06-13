/**
 * 간단한 웹 서버.
 */

import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_static/shelf_static.dart';
import 'package:metadata_fetch/metadata_fetch.dart';

void main() async {
  final dioInstance = dio.Dio();

  final staticHandler = createStaticHandler(
    'build/web',
    defaultDocument: 'index.html',
  );

  final router = Router(notFoundHandler: staticHandler);
  final apiUrl = '/api';

  router.get('$apiUrl/test', (Request request) {
    return Response.ok('ok');
  });

  router.get('$apiUrl/metadata/<encodedUrl>',
      (Request request, String encodedUrl) async {
    final url = Uri.decodeComponent(encodedUrl);
    final metadata = await MetadataFetch.extract(url);

    final Map<String, String?> result = {
      'title': metadata?.title,
      'description': metadata?.description,
      'imageUrl': metadata?.image,
    };

    return Response.ok(json.encode(result));
  });

  router.get('$apiUrl/forward/<encodedUrl>',
      (Request request, String encodedUrl) async {
    final url = Uri.decodeComponent(encodedUrl);

    final response = await dioInstance.get(
      url,
      options: dio.Options(responseType: dio.ResponseType.stream),
    );

    return Response.ok(
      response.data.stream,
      headers: {'content-type': 'application/octet-stream'},
    );
  });

  // 서버 정의.
  final server = await shelf_io.serve(router, '0.0.0.0', 3000);

  // 내용물 압축.
  server.autoCompress = true;

  print('Serving at http://${server.address.host}:${server.port}');
}
