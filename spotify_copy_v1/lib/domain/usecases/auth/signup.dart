import 'package:dartz/dartz.dart';
import 'package:spotify_copy_v1/core/usecase/usecase.dart';
import 'package:spotify_copy_v1/domain/repository/auth/auth.dart';

import '../../../data/models/auth/create_user_req.dart';
import '../../../service_locator.dart';

class SignUpUseCase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) {
    return sl<AuthRepository>().signup(params!);
  }
}
