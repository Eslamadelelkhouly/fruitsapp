import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruitsapp/core/services/database_services.dart';

class FireStoreServices implements DatabaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentID}) async {
    if (documentID != null) {
      await firestore.collection(path).add(data);
    } else {
      await firestore.collection(path).doc(documentID).set(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String documentId}) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.data() as Map<String, dynamic>;
  }
}
