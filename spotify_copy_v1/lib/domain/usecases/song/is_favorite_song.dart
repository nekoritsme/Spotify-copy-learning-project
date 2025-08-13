import 'package:spotify_copy_v1/core/usecase/usecase.dart';
import 'package:spotify_copy_v1/domain/repository/song/song.dart';

import '../../../service_locator.dart';

class isFavoriteSongUseCase implements UseCase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    return await sl<SongsRepository>().isFavoriteSong(params!);
  }
}
