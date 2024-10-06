// Mô hình dữ liệu UserModel
class UserModel {
  final String id;
  final String email;
  final String userName;
  final double totalMoney;

  // Constructor với required fields và totalMoney mặc định là 0
  UserModel({
    required this.id,
    required this.email,
    required this.userName,
    this.totalMoney = 0.0, // Mặc định totalMoney là 0.0 nếu không được cung cấp
  });

  // Chuyển đổi đối tượng thành Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'userName': userName,
      'totalMoney': totalMoney, // Thêm trường totalMoney vào Map
    };
  }

  // Phương thức factory để tạo đối tượng từ Map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      userName: map['userName'] ?? '',
      totalMoney: map['totalMoney']?.toDouble() ?? 0.0,
    );
  }
}
