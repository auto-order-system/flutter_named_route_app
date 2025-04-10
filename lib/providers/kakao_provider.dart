import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KakaoProvider {
  Future<OAuthToken?> login() async {
    try {
      OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
      print('카카오톡으로 로그인 성공: ${token.accessToken}');
      return token;
    } catch (e) {
      print('카카오톡으로 로그인 실패: $e');
      return null;
    }
  }

  Future<User?> getUserInfo() async {
    try {
      User user = await UserApi.instance.me();
      print('사용자 정보: ${user.kakaoAccount?.profile?.nickname}');
      return user;
    } catch (e) {
      print('사용자 정보 가져오기 실패: $e');
      return null;
    }
  }

  Future<void> saveUserInfo(String id, String name, String nickname, String gender, String ageRange, String token, String phoneNumber) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('id', id);
    await prefs.setString('name', name);
    await prefs.setString('nickname', nickname);
    await prefs.setString('gender', gender);
    await prefs.setString('ageRange', ageRange);
    await prefs.setString('token', token);
    await prefs.setString('phoneNumber', phoneNumber);
  }

  Future<Map<String, String?>> getUserInfoFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'id': prefs.getString('id'),
      'name': prefs.getString('name'),
      'nickname': prefs.getString('nickname'),
      'gender': prefs.getString('gender'),
      'ageRange': prefs.getString('ageRange'),
      'token': prefs.getString('token'),
      'phoneNumber': prefs.getString('phoneNumber'),
    };
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') != null;
  }
}