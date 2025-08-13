import 'package:get_it/get_it.dart';
import 'package:spotify_copy_v1/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify_copy_v1/data/repository/song/song_repository_impl.dart';
import 'package:spotify_copy_v1/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_copy_v1/data/sources/song/song_firebase_service.dart';
import 'package:spotify_copy_v1/domain/repository/auth/auth.dart';
import 'package:spotify_copy_v1/domain/repository/song/song.dart';
import 'package:spotify_copy_v1/domain/usecases/auth/get_user.dart';
import 'package:spotify_copy_v1/domain/usecases/auth/signin.dart';
import 'package:spotify_copy_v1/domain/usecases/song/get_favorite_song.dart';
import 'package:spotify_copy_v1/domain/usecases/song/get_news_songs.dart';
import 'package:spotify_copy_v1/domain/usecases/song/get_play_list.dart';

import 'domain/usecases/auth/signup.dart';
import 'domain/usecases/song/add_or_remove_favorite_song.dart';
import 'domain/usecases/song/is_favorite_song.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseService());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());

  sl.registerSingleton<SigninUseCase>(SigninUseCase());

  sl.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());

  sl.registerSingleton<SongsRepository>(SongRepositoryImpl());

  sl.registerSingleton<GetNewsSongsUseCase>(GetNewsSongsUseCase());
  sl.registerSingleton<GetPlayListUseCase>(GetPlayListUseCase());

  sl.registerSingleton<AddOrRemoveFavoriteSongUseCase>(
      AddOrRemoveFavoriteSongUseCase());

  sl.registerSingleton<isFavoriteSongUseCase>(isFavoriteSongUseCase());

  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());

  sl.registerSingleton<GetFavoriteSongsUseCase>(GetFavoriteSongsUseCase());
}
