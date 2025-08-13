import 'package:dartz/dartz.dart';
import 'package:spotify_copy_v1/data/models/auth/create_user_req.dart';
import 'package:spotify_copy_v1/data/models/auth/signin_user_req.dart';
import 'package:spotify_copy_v1/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_copy_v1/domain/repository/auth/auth.dart';
import 'package:spotify_copy_v1/service_locator.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either> signin(SigninUserReq signInUserReq) async {
    return await sl<AuthFirebaseService>().signin(signInUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signup(createUserReq);
  }

  @override
  Future<Either> getUser() async {
    return await sl<AuthFirebaseService>().getUser();
  }
}
