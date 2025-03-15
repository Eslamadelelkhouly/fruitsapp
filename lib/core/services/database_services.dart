abstract class DatabaseServices {
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentID});
  Future<Map<String, dynamic>> getData(
      {required String path, required String documentId});
  Future<bool> checkUserIfExist(
      {required String path, required String documentId});
}
