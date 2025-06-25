import 'user.dart';

class LoginResponse {
  final String message;
  final User user;

  LoginResponse({
    required this.message,
    required this.user,
  });
/*
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    final userData = json['data'] ?? {};
    return LoginResponse(
      message: json['message'] ?? '',
      user: User.fromJson(userData),
    );
  }
*/

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> map = Map<String, dynamic>.from(json);
    final userData = Map<String, dynamic>.from(map['data'] ?? {});
    return LoginResponse(
      message: map['message'] ?? '',
      user: User.fromJson(userData),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': user.toJson(),
    };
  }
}
