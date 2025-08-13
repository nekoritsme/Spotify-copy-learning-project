import 'package:dartz/dartz.dart';
import 'package:spotify_copy_v1/core/usecase/usecase.dart';
import 'package:spotify_copy_v1/domain/repository/song/song.dart';

import '../../../service_locator.dart';

class GetNewsSongsUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongsRepository>().getNewsSongs();
  }
}
