import 'package:easy_song/core/database/app_database.dart';
import 'package:easy_song/features/favorites/application/add_favorite_song_use_case.dart';
import 'package:easy_song/features/favorites/application/is_favorite_song_use_case.dart';
import 'package:easy_song/features/favorites/application/remove_favorite_song_use_case.dart';
import 'package:easy_song/features/favorites/domain/favorite_song_repository.dart';
import 'package:easy_song/features/favorites/infrastructure/favorite_song_repository_impl.dart';
import 'package:easy_song/features/favorites/infrastructure/local/favorite_song_dao.dart';
import 'package:easy_song/features/home/application/get_song_by_id_use_case.dart';
import 'package:easy_song/features/home/application/get_songs_use_case.dart';
import 'package:easy_song/features/home/domain/song_repository.dart';
import 'package:easy_song/features/home/infrastructure/remote/song_api.dart';
import 'package:easy_song/features/home/infrastructure/song_repository_impl.dart';
import 'package:easy_song/features/home/presentation/home_view_model.dart';
import 'package:easy_song/features/home/presentation/song_detail/song_detail_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  _setupCore();
  _setupHome();
  _setupFavorites();
  _setupViewModels();
}

void _setupCore() {
  // One database for the whole app, shared by every feature
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());
}

void _setupHome() {
  getIt.registerLazySingleton<SongApi>(() => SongApi());

  getIt.registerLazySingleton<SongRepository>(
    () => SongRepositoryImpl(api: getIt<SongApi>()),
  );

  getIt.registerLazySingleton<GetSongsUseCase>(
    () => GetSongsUseCase(repository: getIt<SongRepository>()),
  );
  getIt.registerLazySingleton<GetSongByIdUseCase>(
    () => GetSongByIdUseCase(repository: getIt<SongRepository>()),
  );
}

void _setupFavorites() {
  getIt.registerLazySingleton<FavoriteSongDao>(
    () => getIt<AppDatabase>().favoriteSongDao,
  );

  getIt.registerLazySingleton<FavoriteSongRepository>(
    () => FavoriteSongRepositoryImpl(dao: getIt<FavoriteSongDao>()),
  );

  getIt.registerLazySingleton<AddFavoriteSongUseCase>(
    () => AddFavoriteSongUseCase(repository: getIt<FavoriteSongRepository>()),
  );
  getIt.registerLazySingleton<RemoveFavoriteSongUseCase>(
    () => RemoveFavoriteSongUseCase(repository: getIt<FavoriteSongRepository>()),
  );
  getIt.registerLazySingleton<IsFavoriteSongUseCase>(
    () => IsFavoriteSongUseCase(repository: getIt<FavoriteSongRepository>()),
  );
}

// ViewModels hold screen state, a new instance every time
void _setupViewModels() {
  getIt.registerFactory<HomeViewModel>(
    () => HomeViewModel(useCase: getIt<GetSongsUseCase>()),
  );
  getIt.registerFactory<SongDetailViewModel>(
    () => SongDetailViewModel(
      getSongByIdUseCase: getIt<GetSongByIdUseCase>(),
      isFavoriteSongUseCase: getIt<IsFavoriteSongUseCase>(),
      addFavoriteSongUseCase: getIt<AddFavoriteSongUseCase>(),
      removeFavoriteSongUseCase: getIt<RemoveFavoriteSongUseCase>(),
    ),
  );
}
