import 'package:spotify_copy_v1/domain/entities/auth/user.dart';

class UserModel {
  String? fullName;
  String? email;
  String? imageURL;

  UserModel({
    this.fullName,
    this.email,
  });

  UserModel.fromJson(Map<String, dynamic> data) {
    fullName = data["name"];
    email = data["email"];
  }
}

extension UserModelX on UserModel {
  UserEntity toEntity() {
    return UserEntity(fullName: fullName, email: email, imageURL: imageURL);
  }
}
