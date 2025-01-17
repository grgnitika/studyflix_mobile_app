import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String userId; // Non-nullable userId
  final String username;
  final String email;
  final String password;

  const UserEntity({
    required this.userId, // Ensure non-nullable
    required this.username,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        userId,
        username,
        email,
        password
      ]; // Include password for full comparison
}
