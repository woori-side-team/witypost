import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:wity_post/models/post_model.dart';

void main() {
  test('post model test', () {
    const Map<String, dynamic> inputJson = {
      'postUrl': 'http://abc.def',
      'title': 'MyTitle',
      'description': null,
    };

    final outputPostModel = PostModel.fromJson(inputJson);
    expect(outputPostModel.postUrl, 'http://abc.def');
    expect(outputPostModel.title, 'MyTitle');
    expect(outputPostModel.description, null);
    expect(outputPostModel.imageUrl, null);

    final outputJson = outputPostModel.toJson();
    final outputJsonString = json.encode(outputJson);
    expect(outputJsonString.contains('"description":null'), true);
    expect(outputJsonString.contains('"imageUrl":null'), true);
  });
}
