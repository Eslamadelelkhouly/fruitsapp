import 'package:fruitsapp/features/auth/domain/entities/user_entity.dart';

abstract class DatabaseServices {
  Future<void> addUser(
      {required String path, required Map<String, dynamic> data});
  Future<Map<String, dynamic>> getData(
      {required String path, required String documentId});
}
