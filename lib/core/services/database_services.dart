abstract class DatabaseServices {
  Future<void> addUser(
      {required String path, required Map<String, dynamic> data});
}
