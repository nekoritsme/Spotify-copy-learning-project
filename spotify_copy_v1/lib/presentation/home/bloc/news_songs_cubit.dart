import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_copy_v1/domain/usecases/song/get_news_songs.dart';
import 'package:spotify_copy_v1/presentation/home/bloc/news_songs_state.dart';
import 'package:spotify_copy_v1/service_locator.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewsSongs() async {
    Either returnedSongs = await sl<GetNewsSongsUseCase>().call();

    returnedSongs.fold(
      (failure) => emit(NewsSongsLoadFailure()),
      (songs) => emit(NewsSongsLoaded(songs: songs)),
    );
  }
}
