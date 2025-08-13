import 'package:spotify_copy_v1/domain/entities/auth/user.dart';

abstract class ProfileInfoState {}

class ProfileInfoLoading implements ProfileInfoState {}

class ProfileInfoLoaded implements ProfileInfoState {
  final UserEntity userEntity;

  ProfileInfoLoaded({required this.userEntity});
}

class ProfileInfoFailure extends ProfileInfoState {}
