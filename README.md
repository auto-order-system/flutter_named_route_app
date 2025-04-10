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
