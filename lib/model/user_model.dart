class UserModel {
  late String? uid;
  late String? email;

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
    
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email':email,
      };
  }
  UserModel({
    this.uid,
    this.email,
  });
  // receiving data from server
  // sending data to our server
}
