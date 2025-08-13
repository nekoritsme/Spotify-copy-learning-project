import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_copy_v1/domain/entities/song/song.dart';
import 'package:spotify_copy_v1/domain/usecases/song/get_favorite_song.dart';
import 'package:spotify_copy_v1/presentation/profile/bloc/favorite_songs_state.dart';

import '../../../service_locator.dart';

class FavoriteSongsCubit extends Cubit<FavoriteSongsState> {
  FavoriteSongsCubit() : super(FavoriteSongsLoading());

  List<SongEntity> favoriteSongs = [];

  Future<void> getFavoriteSongs() async {
    var result = await sl<GetFavoriteSongsUseCase>().call();

    result.fold(
      (l) {
        emit(FavoriteSongsFailure());
      },
      (r) {
        favoriteSongs = r;
        emit(FavoriteSongsLoaded(favoriteSongs: favoriteSongs));
      },
    );
  }

  void removeSong(int index) {
    favoriteSongs.removeAt(index);
    emit(FavoriteSongsLoaded(favoriteSongs: favoriteSongs));
  }
}
