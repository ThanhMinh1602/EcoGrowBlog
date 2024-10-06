import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  // Singleton pattern: chỉ tạo một instance duy nhất của SharedPreferencesService
  static final SharedPreferencesService _instance =
      SharedPreferencesService._internal();

  SharedPreferences? _preferences;

  SharedPreferencesService._internal();

  factory SharedPreferencesService() {
    return _instance;
  }

  // Khởi tạo SharedPreferences
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Đặt giá trị trạng thái mở ứng dụng lần đầu
  Future<void> setFirstTime(bool isFirstTime) async {
    await _preferences?.setBool('isFirstTime', isFirstTime);
  }

  // Lấy giá trị trạng thái mở ứng dụng lần đầu
  bool isFirstTime() {
    return _preferences?.getBool('isFirstTime') ?? true;
  }

  // Đặt giá trị UID (lưu UID sau khi đăng nhập)
  Future<void> setUid(String uid) async {
    await _preferences?.setString('uid', uid);
  }

  // Lấy UID (được lưu sau khi đăng nhập)
  Future<String?> getUid() async {
    return _preferences?.getString('uid');
  }

  // Xóa giá trị UID khi đăng xuất
  Future<void> clearUid() async {
    await _preferences?.remove('uid');
  }

  // Xóa tất cả các dữ liệu trong SharedPreferences
  Future<void> clearAll() async {
    await _preferences?.clear();
  }
}
