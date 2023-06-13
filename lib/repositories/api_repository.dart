import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:wity_post/models/post_model.dart';

class _ApiRepository {
  final baseUrl = '';
  late final dioInstance = dio.Dio(dio.BaseOptions(baseUrl: baseUrl));

  Future<String> test() async {
    final response = await dioInstance.get('$baseUrl/api/test');
    return response.data;
  }

  Future<PostModel> getPost(String postUrl) async {
    final encodedPostUrl = Uri.encodeComponent(postUrl);
    final response =
        await dioInstance.get('$baseUrl/api/metadata/$encodedPostUrl');
    return PostModel.fromJson(json.decode(response.data));
  }

  String getForwardUrl(String fileUrl) {
    final encodedFileUrl = Uri.encodeComponent(fileUrl);
    return '$baseUrl/api/forward/$encodedFileUrl';
  }
}

final apiRepository = _ApiRepository();
