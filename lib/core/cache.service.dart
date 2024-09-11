import 'package:shared_preferences/shared_preferences.dart';

const String USERID = "userId";
const String AUTH_TOKEN = "authToken";
const String PROFILE_UPDATE = "profileStatus";
const String USER_NAME = "userName";
const String USERPASSWORD = "password";
// const String ADMINSTATUS = "adminStatus";

class CacheService {
  Future<void> setCache(String key, dynamic value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    }
  }

  Future<dynamic> getCache(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  Future<void> setUserId(String? userId) async {
    await setCache(USERID, userId);
  }

  Future<void> setUserName(String? userName) async {
    await setCache(USER_NAME, userName);
  }

  Future<void> setProfile(bool profileStatus) async {
    await setCache(PROFILE_UPDATE, profileStatus);
  }

  Future<String?> getUserId() async {
    final userId = await getCache(USERID);
    if (userId == null || userId == "") return null;
    return "$userId";
  }

  Future<String?> getUserName() async {
    final userName = await getCache(USER_NAME);
    if (userName == null || userName == "") return null;
    return "$userName";
  }

  Future<bool?> getProfileStatus() async {
    final profileStatus = await getCache(PROFILE_UPDATE);
    if (profileStatus == null) return null;
    return profileStatus as bool?;
  }

  Future<String?> getAuthToken() async {
    return await getCache(AUTH_TOKEN);
  }

  Future<void> setAuthToken(String token) async {
    await setCache(AUTH_TOKEN, token);
  }

  Future<void> removeAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<void> setPassWord(String? password) async {
    await setCache(USERPASSWORD, password);
  }

  Future<String?> getPassWord() async {
    final password = await getCache(USERPASSWORD);
    if (password == null || password == "") return null;
    return "$password";
  }

  // Future<String?> getAdminStatus() async {
  //   final adminStatus = await getCache(ADMINSTATUS);
  //   if (adminStatus == null || adminStatus == "") return null;
  //   print('adminStatusadminStatusadminStatus$adminStatus');
  //   return "$adminStatus";
  // }

  //  Future<bool?> getAdminStatus() async {
  //   final adminStatus = await getCache(ADMINSTATUS);
  //   if (adminStatus == null) return null;
  //   return adminStatus as bool?;
  // }
}
