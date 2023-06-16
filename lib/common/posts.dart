class PostInfo {
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
  PostInfo(
    postUrl: '''https://zero-base.co.kr/event/media_BE_school_roadmap''',
    title: '''2023 백엔드 개발자 로드맵 feat. 현직 백엔드 개발자 | zero-base''',
    description: '''0에서 1은 만들어주는 백엔드 6개월 공부 로드맵''',
    imageUrl: '''assets/post_images/post_image_1686906353574''',
  ),
  PostInfo(
    postUrl: '''https://velog.io/@lky5697/the-const-deception''',
    title: '''[번역] “const”의 속임수''',
    description:
        '''자바스크립트에서 할당과 뮤테이션의 차이에 대한 탐구원문 : https&#x3A;//www.joshwcomeau.com/javascript/the-const-deception/자바스크립트에서 const 키워드는 상수를 선언하는 데 사용됩니다. 상수는 종종 "변경할 수 없''',
    imageUrl: '''assets/post_images/post_image_1686906354507''',
  ),
  PostInfo(
    postUrl:
        '''https://stackoverflow.com/questions/1273108/how-do-i-git-rm-a-file-without-deleting-it-from-disk''',
    title: '''파일을 내 컴퓨터에서 지우지 않고 git 상에서만 지우기''',
    description:
        '''The command removes the file in my system. I meant it to remove only the file from Git-repository.

How can I remove the file from a Git repository, without removing the file in my system?''',
    imageUrl: '''assets/post_images/post_image_1686906355404''',
  ),
  PostInfo(
    postUrl:
        '''https://velog.io/@baby_dev/%ED%94%84%EB%A1%A0%ED%8A%B8%EC%97%94%EB%93%9C-cicd-%EB%B9%8C%EB%93%9C-%EC%86%8D%EB%8F%84-%EC%B5%9C%EC%A0%81%ED%99%94-feat.-docker-multi-staging''',
    title: '''프론트엔드 ci/cd 속도 최적화 (feat. docker multi staging)''',
    description: '''11분 -> 1분내외? 어케했는교''',
    imageUrl: '''assets/post_images/post_image_1686906356351''',
  ),
  PostInfo(
    postUrl:
        '''https://devconnected.com/how-to-remove-files-from-git-commit/''',
    title: '''How To Remove Files From Git Commit – devconnected''',
    description:
        '''Learn how you can remove files from commit easily using the git reset command. Remove files on newer versions using the git restore command.''',
    imageUrl: '''assets/post_images/post_image_1686906357980''',
  ),
];
