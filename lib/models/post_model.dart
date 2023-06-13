class PostModel {
  /// 포스트 원본의 URL.
  final String postUrl;

  /// 글 제목.
  final String title;

  /// 글 설명.
  final String? description;

  /// 글 이미지 URL.
  final String? imageUrl;

  const PostModel({
    required this.postUrl,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  PostModel.fromJson(Map<String, dynamic> json)
      : postUrl = json['postUrl'],
        title = json['title'],
        description = json['description'],
        imageUrl = json['imageUrl'];

  Map<String, dynamic> toJson() => {
        'postUrl': postUrl,
        'title': title,
        'description': description,
        'imageUrl': imageUrl,
      };
}
