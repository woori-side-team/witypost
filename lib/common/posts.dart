// 이 파일은 자동으로 생성됩니다.

class PostInfo {
  final String postUrl;
  final String? title;
  final String? description;
  final String? imageUrl;
  final List<String> tags;
  
  const PostInfo({
    required this.postUrl,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.tags,
  });
}

const List<PostInfo> postInfos = [
  PostInfo(
    postUrl: '''https://euncho.medium.com/프론트엔드-학습-로드맵-91c3bc11dec0''',
    title: '''프론트엔드 학습 로드맵''',
    description: '''2022년에 프론트엔드 배우기''',
    imageUrl: '''assets/post_images/post_image_1688006568895''',
    tags: ['프론트엔드', '진로', '로드맵'],
  ),
  PostInfo(
    postUrl: '''https://zero-base.co.kr/event/media_BE_school_roadmap''',
    title: '''2023 백엔드 개발자 로드맵 feat. 현직 백엔드 개발자 | zero-base''',
    description: '''0에서 1은 만들어주는 백엔드 6개월 공부 로드맵''',
    imageUrl: '''assets/post_images/post_image_1688006569191''',
    tags: ['백엔드', '진로', '로드맵'],
  ),
  PostInfo(
    postUrl: '''https://zero-base.co.kr/event/media_insight_contents_BE_front_back''',
    title: '''프론트엔드 백엔드 차이, 무엇을 시작할지 고민이라면? (개념, 장단점, 전망 모두 알려드려요.) | zero-base''',
    description: '''프론트엔드 백엔드 연봉 차이부터 전망성까지 현직 개발자가 알려드립니다.''',
    imageUrl: '''assets/post_images/post_image_1688006569296''',
    tags: ['프론트엔드', '백엔드', '진로'],
  ),
  PostInfo(
    postUrl: '''https://engineering.linecorp.com/ko/blog/things-i-prepared-to-be-a-line-server-developer''',
    title: '''LINE 서버 개발자가 되기까지 내가 준비한 것들''',
    description: ''' 이 글은 마이크로소프트웨어 397호에 기고된 글입니다.  들어가며  시대와 상황이 많이 바뀌었지만, 아직 우리나라에서 ‘이직’은 낯선 단어입니다. 저희 부모님은 평생 직업과 평생 직장이라는 타이틀을 간직하며 살았던 세대인데요. 그런 부모...''',
    imageUrl: '''assets/post_images/post_image_1688006570882''',
    tags: ['백엔드', '진로'],
  ),
  PostInfo(
    postUrl: '''https://www.elancer.co.kr/blog/view?seq=81''',
    title: '''비전공 개발자가 IT 프리랜서 개발자가 되기까지 | 이랜서 인터뷰''',
    description: '''전자공학과 출신의 비전공 개발자가 IT 프리랜서 개발자가 되기까지 겪은 과정과 노하우를 인터뷰를 통해 공개합니다. ''',
    imageUrl: '''assets/post_images/post_image_1688006571151''',
    tags: ['진로', '인터뷰'],
  ),
  PostInfo(
    postUrl: '''https://eopla.net/magazines/14''',
    title: '''비전공자가 배달의 민족 리드 개발자가 되기까지''',
    description: null,
    imageUrl: '''assets/post_images/post_image_1688006573761''',
    tags: ['진로', '인터뷰'],
  ),
  PostInfo(
    postUrl: '''https://wikidocs.net/51''',
    title: '''파이썬 맛보기''',
    description: '''* 강의 영상: https://youtu.be/ymSAvh-hntA/  프로그래밍은 재미있습니다. 진짜로 재미있습니다.  그 재미를 알려면 프로그래밍을 직접 해봐야하는데, 사실 …''',
    imageUrl: '''assets/post_images/post_image_1688006574317''',
    tags: ['파이썬', '기술'],
  ),
  PostInfo(
    postUrl: '''https://poiemaweb.com/html5-syntax''',
    title: '''HTML5 Introduction & Syntax | PoiemaWeb''',
    description: '''HTML (HyperText Markup Language)은 웹페이지를 기술하기 위한 마크업 언어이다. 조금 더 자세히 말하면 웹페이지의　내용(content)과 구조(structure)을 담당하는 언어로써 HTML 태그를 통해 정보를 구조화하는 것이다.　HTML5는 HTML의 최신 버전으로 아래와 같은 기능들이 추가되었다.''',
    imageUrl: '''assets/post_images/post_image_1688006574945''',
    tags: ['프론트엔드', '기술', 'HTML'],
  ),
  PostInfo(
    postUrl: '''https://poiemaweb.com/css3-syntax''',
    title: '''CSS3 Syntax | PoiemaWeb''',
    description: '''CSS(Cascading Style Sheets)는 HTML이나 XML과 같은 구조화 된 문서(Document)를 화면, 종이 등에 어떻게 렌더링할 것인지를 정의하기 위한 언어이다. 즉, CSS는 HTML의 각 요소(Element)의 style(design, layout etc)을 정의하여 화면(Screen) 등에 어떻게 렌더링하면 되는지 브라우저에게 설명하기 위한 언어이다.''',
    imageUrl: '''assets/post_images/post_image_1688006575238''',
    tags: ['프론트엔드', '기술', 'CSS'],
  ),
  PostInfo(
    postUrl: '''https://react.vlpt.us/''',
    title: '''벨로퍼트와 함께하는 모던 리액트 · GitBook''',
    description: null,
    imageUrl: null,
    tags: ['프론트엔드', '기술', 'React'],
  ),
  PostInfo(
    postUrl: '''https://velog.io/@velopert/react-hooks''',
    title: '''리액트의 Hooks 완벽 정복하기''',
    description: '''React Hooks 는 v16.8 에 도입된 개념으로서, 함수형 컴포넌트에서도 상태 관리를 할 수 있는 useState, 그리고 렌더링 직후 작업을 설정하는 useEffect 등의  기능을 제공합니다. 이에 대하여 한번 자세히 알아봅시다.''',
    imageUrl: '''assets/post_images/post_image_1688006576899''',
    tags: ['프론트엔드', '기술', 'React'],
  ),
  PostInfo(
    postUrl: '''https://coding-groot.tistory.com/32''',
    title: '''[유니티] Unity 입문하기 1 :: 유니티 설치 및 화면 구성''',
    description: '''설치하기 유니티는 유니티 허브로 설치를 할 수도 있고 그냥 한 가지의 버전만 다운로드하여서 설치할 수 있습니다. 유니티가 버전이 여러 가지가 있습니다. 유니티 허브는 그러한 여러 가지의 버전의 유니티들을 정리해서 관리해주는 매니저라고 이해하시면 됩니다. 유니티 허브 다운은 유니티 다운로드에 들어가서 다운로드할 수 있습니다. 링크: https://unity3d.com/kr/get-unity/download Download Unity! Unity is the ultimate game development platform. Use Unity to build high-quality 3D and 2D games, deploy them across mobile, desktop, VR/AR, consoles or t..''',
    imageUrl: '''assets/post_images/post_image_1688006577241''',
    tags: ['게임', '기술', 'Unity'],
  ),
  PostInfo(
    postUrl: '''https://docs.unrealengine.com/4.27/ko/ProgrammingAndScripting/ProgrammingWithCPP/IntroductionToCPP/''',
    title: '''UE4 C++ 프로그래밍 입문''',
    description: '''언리얼 엔진이 처음이신 C++ 프로그래머를 위한 입문 안내서입니다.''',
    imageUrl: '''assets/post_images/post_image_1688006578225''',
    tags: ['게임', '기술', 'Unreal'],
  ),
  PostInfo(
    postUrl: '''https://realmojo.tistory.com/300''',
    title: '''프론트엔드 개발자 기술면접 인터뷰 질문 모음(업데이트)''',
    description: '''프론트엔드 기술면접 실제현업 질문 모음 최근 1년 간 프론트엔드 면접을 7번 정도 본 것 같다. 국내 IT 대기업 N사만 여러번, K사, 온라인쇼핑몰 C사 등등 여러군데를 면접을 진행했으며 비록 떨어졌지만 여러모로 좋은 경험을 하였습니다. 프론트엔드 엔지니어를 꿈꾸는 시니어 주니어 엔지니어들에게 면접을 진행하기전 필수적으로 알아야 할 질문과 마음가짐에 대해서 공유해보려고 합니다. 다른 프론트엔드 기술면접 관련된 글도 많지만 너무 많아서 조금 요약을 해보려고 합니다. 면접관으로 들어가시는 분들께서도 어떤 질문을 할지 모를 경우에는 참고하셨으면 좋겠습니다. Frontend 필수 언어 중요도 설명 ★★★★★ 프론트 엔지니어를 꿈꾼다면 정확하게 알고 있어야 하는 것들이며 하나라도 모르면 떨어진다고 봐도 무방하다..''',
    imageUrl: '''assets/post_images/post_image_1688006578383''',
    tags: ['프론트엔드', '진로', '면접'],
  ),
  PostInfo(
    postUrl: '''https://velog.io/@arthur/지금까지-받았던-신입-프론트엔드-면접-질문들''',
    title: '''지금까지 받았던 신입 프론트엔드 면접 질문들''',
    description: '''그동안 면접에서 받았던 질문들 정리''',
    imageUrl: '''assets/post_images/post_image_1688006579120''',
    tags: ['프론트엔드', '진로', '면접'],
  ),
  PostInfo(
    postUrl: '''https://zero-base.co.kr/event/media_BE_school_qna''',
    title: '''현직자가 말하는 신입 백엔드 개발 면접 질문 ｜ 제로베이스  | zero-base''',
    description: '''신입 백엔드 개발자 면접 전 꼭 읽어봐야 할 기본 질문 15가지''',
    imageUrl: '''assets/post_images/post_image_1688006579309''',
    tags: ['백엔드', '진로', '면접'],
  ),
  PostInfo(
    postUrl: '''https://github.com/ksundong/backend-interview-question''',
    title: '''GitHub - ksundong/backend-interview-question: 백엔드 개발자로 입사를 준비하며 받았던 질문, 예상했던 질문, 인터넷 참고한 질문(CC BY-NC)''',
    description: '''백엔드 개발자로 입사를 준비하며 받았던 질문, 예상했던 질문, 인터넷 참고한 질문(CC BY-NC) - GitHub - ksundong/backend-interview-question: 백엔드 개발자로 입사를 준비하며 받았던 질문, 예상했던 질문, 인터넷 참고한 질문(CC BY-NC)''',
    imageUrl: '''assets/post_images/post_image_1688006580008''',
    tags: ['백엔드', '진로', '면접'],
  ),
];
