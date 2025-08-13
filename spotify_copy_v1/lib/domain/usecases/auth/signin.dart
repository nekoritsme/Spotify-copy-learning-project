import 'package:dartz/dartz.dart';
import 'package:spotify_copy_v1/core/usecase/usecase.dart';
import 'package:spotify_copy_v1/data/models/auth/signin_user_req.dart';
import 'package:spotify_copy_v1/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';

class SigninUseCase implements UseCase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) {
    return sl<AuthRepository>().signin(params!);
  }
}
