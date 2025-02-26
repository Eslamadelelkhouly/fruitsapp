import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruitsapp/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.name,
    required super.email,
    required super.Uid,
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      Uid: user.uid ?? '',
    );
  }
}
