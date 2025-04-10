import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../providers/kakao_provider.dart';
import 'my_page_screen.dart';

class LoginScreen extends StatelessWidget {
  final KakaoProvider kakaoProvider = KakaoProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                OAuthToken? token = await kakaoProvider.login();
                if (token != null) {
                  User? user = await kakaoProvider.getUserInfo();
                  if (user != null) {
                    String id = user.id.toString();
                    String name = user.kakaoAccount?.profile?.nickname ?? '';
                    String nickname = user.kakaoAccount?.profile?.nickname ?? '';
                    String gender = user.kakaoAccount?.gender.toString() ?? '';
                    String ageRange = user.kakaoAccount?.ageRange.toString() ?? '';
                    String phoneNumber = user.kakaoAccount?.phoneNumber ?? '';
                    await kakaoProvider.saveUserInfo(id, name, nickname, gender, ageRange, token.accessToken, phoneNumber);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MyPageScreen()),
                    );
                  }
                }
              },
              child: Text('카카오로 로그인하기'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Color(0xFFFFE812), // 텍스트 색상
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}