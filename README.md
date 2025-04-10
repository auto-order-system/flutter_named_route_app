🔧 주요 작업 내용

1. 라우팅 방식 전환
	•	기존의 직접 위젯 불러오는 방식에서 → Named Route 방식으로 전체 화면 전환 구조 수정함.
	•	MaterialApp의 home:과 routes: 설정을 활용해 화면 간 이동을 일관되게 관리할 수 있도록 변경함.

2. MainScreen 라우트 추가
	•	main.dart의 routes 맵에 'main' 키로 MainScreen() 등록.
	•	Navigator.pushNamed(context, '/main') 등을 통해 호출 가능하게 구조화함.

3. 전체 파일에 적용
	•	Navigator.push() → Navigator.pushNamed()로 전체 화면 이동 로직 변경 완료.
	•	각 화면 파일에서 context 기반으로 route name을 이용해 이동하도록 코드 일괄 수정함.


좋아! Navigator.push() 방식과 Navigator.pushNamed() 방식의 차이점, 장단점, 그리고 사용 예시까지 아래에 깔끔하게 정리해줄게. 플러터 입문자도 이해할 수 있게 설명했어.

⸻

📍 Navigator.push vs Navigator.pushNamed 차이점 정리

항목	Navigator.push 방식	Navigator.pushNamed 방식 (routes)
✅ 사용 방식	직접 위젯 클래스를 전달	미리 등록한 라우트 이름을 통해 이동
✅ 라우트 관리	한 곳에서 전체 라우트 관리 불가	MaterialApp의 routes:에 라우트 등록
✅ 유지보수	페이지 많아지면 관리 어려움	이름 기반으로 일괄 관리 가능
✅ 복잡도	단순하고 직관적	초기에 구조 잡을 필요 있음
✅ 매개변수 전달	MaterialPageRoute 안에서 직접 전달	Navigator.pushNamed(context, '/route', arguments: ...)로 전달



⸻

✨ 간단한 예시 비교

📌 1. Navigator.push 방식

Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => MenuDetailScreen(menuId: 1),
  ),
);

👉 장점: 바로 MenuDetailScreen을 불러오기 때문에 간단함
👉 단점: 모든 라우트마다 직접 페이지 클래스를 불러와야 해서 코드가 복잡해질 수 있음

⸻

📌 2. Navigator.pushNamed 방식

먼저, main.dart에서 라우트를 등록해줘야 함:

MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => MainScreen(),
    '/menu_detail': (context) => MenuDetailScreen(),
  },
);

그 다음, 이동할 땐 다음과 같이 사용:

Navigator.pushNamed(
  context,
  '/menu_detail',
  arguments: 1, // 필요한 데이터 전달
);

👉 장점: 라우트 경로만 기억하면 어떤 페이지든 호출 가능
👉 단점: routes에 미리 등록해둬야 하고, arguments를 사용하려면 페이지에서 따로 받는 코드 필요

⸻

📦 arguments 받는 방법 예시 (MenuDetailScreen)

class MenuDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int menuId = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(title: Text('메뉴 상세')),
      body: Center(child: Text('메뉴 ID: $menuId')),
    );
  }
}



⸻

✅ 언제 어떤 방식을 써야 할까?

상황	추천 방식
빠르게 테스트하거나 작은 앱	Navigator.push
페이지가 많고 확장 가능한 앱	Navigator.pushNamed + routes



