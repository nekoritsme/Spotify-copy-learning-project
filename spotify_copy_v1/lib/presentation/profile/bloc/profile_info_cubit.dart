import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_copy_v1/domain/usecases/auth/get_user.dart';
import 'package:spotify_copy_v1/presentation/profile/bloc/profile_info_state.dart';

import '../../../service_locator.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {
  ProfileInfoCubit() : super(ProfileInfoLoading());

  Future<void> getUser() async {
    var user = await sl<GetUserUseCase>().call();

    user.fold(
      (l) => emit(ProfileInfoFailure()),
      (userEntity) => emit(
        ProfileInfoLoaded(userEntity: userEntity),
      ),
    );
  }
}
