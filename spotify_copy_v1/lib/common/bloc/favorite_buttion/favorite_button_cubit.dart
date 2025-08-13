import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_copy_v1/common/bloc/favorite_buttion/favorite_button_state.dart';
import 'package:spotify_copy_v1/domain/usecases/song/add_or_remove_favorite_song.dart';

import '../../../service_locator.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  FavoriteButtonCubit() : super(FavoriteButtonInitial());

  void favoriteButtonUpdated(String songId) async {
    var result =
        await sl<AddOrRemoveFavoriteSongUseCase>().call(params: songId);

    result.fold(
      (l) {},
      (r) {
        emit(FavoriteButtonUpdated(isFavorite: r));
      },
    );
  }
}
