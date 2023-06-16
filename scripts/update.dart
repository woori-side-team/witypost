import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:metadata_fetch/metadata_fetch.dart';

int getUnixTime() {
  return DateTime.now().millisecondsSinceEpoch;
}

String valueToRawString<T>(T? value) {
  if (value != null) {
    return "'''$value'''";
  } else {
    return 'null';
  }
}

void main() async {
  // 데이터 요청용.
  final dioInstance = dio.Dio();

  // 입력 읽기.
  final inputPath = 'input.json';
  print('[update] $inputPath 읽는 중...');
  final inputObject = json.decode(await File(inputPath).readAsString());

  // 출력 준비.
  final imagesPath = 'assets/post_images';
  final imagesDirectory = Directory(imagesPath);

  // 기존 이미지들 삭제.
  if (imagesDirectory.existsSync()) {
    imagesDirectory.deleteSync();
  }

  imagesDirectory.createSync();

  final postsFile = File('lib/common/posts.dart');

  if (!postsFile.existsSync()) {
    print('[update] ${postsFile.path}가 없습니다. 생성합니다...');
    postsFile.createSync();
  }

  postsFile.writeAsStringSync('''class PostInfo {
  final String postUrl;
  final String? title;
  final String? description;
  final String? imageUrl;
  
  const PostInfo({
    required this.postUrl,
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

const List<PostInfo> postInfos = [
''', mode: FileMode.write);

  // 각 웹사이트에서 제목, 설명, 이미지 등을 추출하고 저장.
  for (final postInput in inputObject['posts']) {
    final postUrl = postInput['url'];
    print('[update] $postUrl 처리 중...');

    // 웹사이트의 메타데이터 추출.
    final postMetadata = await MetadataFetch.extract(postUrl);

    final postTitle = postInput['title'] ?? postMetadata?.title;
    final postDescription = postMetadata?.description;
    String? postImageUrl = null;

    // Flutter web에서는 일부 경우 (ex. CanvasKit 렌더러 사용할 경우) 이미지 URL의 출처(origin)가 현 페이지와 다르면 CORS 에러 겪게 됨.
    // 따라서 이미지의 경우 다운로드하여 플젝 폴더에 저장하고 그 경로를 URL로 대신 사용.
    if (postMetadata?.image != null) {
      final imageUrl = (postMetadata?.image)!;
      print('-- ${imageUrl} 다운로드...');

      final response = await dioInstance.get(
        imageUrl,
        options: dio.Options(responseType: dio.ResponseType.bytes),
      );

      final outputImagePath =
          '${imagesDirectory.path}/post_image_${getUnixTime()}';
      final outputImageFile = File(outputImagePath);
      print('-- $outputImagePath 생성...');
      outputImageFile.writeAsBytesSync(response.data);

      postImageUrl = outputImagePath;
    }

    postsFile.writeAsStringSync('''  PostInfo(
    postUrl: ${valueToRawString(postUrl)},
    title: ${valueToRawString(postTitle)},
    description: ${valueToRawString(postDescription)},
    imageUrl: ${valueToRawString(postImageUrl)},
  ),
''', mode: FileMode.append);
  }

  postsFile.writeAsStringSync('];\n', mode: FileMode.append);

  print('[update] Done!');
}
