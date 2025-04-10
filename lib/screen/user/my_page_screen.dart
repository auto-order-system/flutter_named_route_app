import 'package:flutter/material.dart';
import '../../providers/kakao_provider.dart';

class MyPageScreen extends StatelessWidget {
  final KakaoProvider kakaoProvider = KakaoProvider();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String?>>(
      future: kakaoProvider.getUserInfoFromPrefs(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('오류 발생: ${snapshot.error}'));
        } else {
          final userInfo = snapshot.data;
          final isLoggedIn = userInfo?['token'] != null;
          final userName = userInfo?['nickname'] ?? '사용자 닉네임';

          return Scaffold(
            appBar: AppBar(
              title: Text('마이페이지'),
              actions: [
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: Icon(Icons.person, size: 30),
                      ),
                      SizedBox(width: 16),
                      GestureDetector(
                        onTap: () {
                          if (!isLoggedIn) {
                            Navigator.pushNamed(context, '/login');
                          }
                        },
                        child: Text(
                          isLoggedIn ? userName+'님 환영합니다' : '로그인하고 앱 사용하기',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.point_of_sale),
                      title: Text('포인트'),
                      subtitle: Text('현재 포인트: 0'),
                    ),
                  ),
                  SizedBox(height: 20),
                  Card(
                    color: Colors.grey[200],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text('혜택정보', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                        GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          childAspectRatio: 3,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                onPressed: () {},
                                child: Text('진행 중인 이벤트', style: TextStyle(fontSize: 16, color: Colors.black)),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                onPressed: () {},
                                child: Text('종료된 이벤트', style: TextStyle(fontSize: 16, color: Colors.black)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Card(
                    color: Colors.grey[200],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text('문의 및 알림', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                        GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          childAspectRatio: 3,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                onPressed: () {},
                                child: Text('고객센터', style: TextStyle(fontSize: 16, color: Colors.black)),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                onPressed: () {},
                                child: Text('자주묻는질문', style: TextStyle(fontSize: 16, color: Colors.black)),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                onPressed: () {},
                                child: Text('공지사항', style: TextStyle(fontSize: 16, color: Colors.black)),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                onPressed: () {},
                                child: Text('약관 및 정책', style: TextStyle(fontSize: 16, color: Colors.black)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}