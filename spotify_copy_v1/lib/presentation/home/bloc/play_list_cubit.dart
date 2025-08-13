import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_copy_v1/presentation/home/bloc/play_list_state.dart';
import 'package:spotify_copy_v1/service_locator.dart';

import '../../../domain/usecases/song/get_play_list.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListLoading());

  Future<void> getPlayList() async {
    Either returnedSongs = await sl<GetPlayListUseCase>().call();

    returnedSongs.fold(
      (failure) => emit(PlayListLoadFailure()),
      (songs) => emit(PlayListLoaded(songs: songs)),
    );
  }
}
