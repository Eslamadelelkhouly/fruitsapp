abstract class DatabaseServices {
  Future<void> addUser(
      {required String path, required Map<String, dynamic> data});
  Future<void> getUserData({required String path, required String id});
}
