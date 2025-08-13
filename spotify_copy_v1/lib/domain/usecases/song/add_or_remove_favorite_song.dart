import 'package:dartz/dartz.dart';
import 'package:spotify_copy_v1/core/usecase/usecase.dart';
import 'package:spotify_copy_v1/domain/repository/song/song.dart';

import '../../../service_locator.dart';

class AddOrRemoveFavoriteSongUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<SongsRepository>().addOrRemoveFavoriteSong(params!);
  }
}
