class UserEntity {
  final String name;
  final String email;
  final String Uid;

  UserEntity({
    required this.name,
    required this.email,
    required this.Uid,
  });

  toMap() {
    return{
      'name': name,
      'email': email,
      'Uid': Uid,
    }; 
  }
}
