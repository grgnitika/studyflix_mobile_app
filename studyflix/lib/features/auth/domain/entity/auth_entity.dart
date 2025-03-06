import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? userId;
  final String? image;
  final String username;
  final String email;
  final String password;
  final String role; // Add role field

  const AuthEntity({
    this.userId,
    this.image,
    required this.username,
    required this.email,
    required this.password,
    required this.role,
  });

  // Initialize Empty Constructor
  const AuthEntity.empty()
      : userId = '_empty.userid',
        username = '_empty.username',
        email = '_empty.email',
        password = '_empty.password',
        role = '_empty.role',
        image = '_empty.image';

  @override
  List<Object?> get props => [userId, image, username, email, password, role];
}
