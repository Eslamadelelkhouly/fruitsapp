import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruitsapp/core/services/database_services.dart';
import 'package:fruitsapp/features/auth/data/models/user_model.dart';
import 'package:fruitsapp/features/auth/domain/entities/user_entity.dart';

class FireStoreServices implements DatabaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addUser(
      {required String path, required Map<String, dynamic> data}) async {
    await firestore.collection(path).add(data);
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String id}) async {
    var data = await firestore.collection(path).doc(id).get();
    return data.data() as Map<String, dynamic>;
  }
}
