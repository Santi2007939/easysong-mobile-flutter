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
  // Infrastructure: one shared instance for the whole app
  getIt.registerLazySingleton<SongApi>(() => SongApi());

  getIt.registerLazySingleton<SongRepository>(
    () => SongRepositoryImpl(api: getIt<SongApi>()),
  );

  // Use cases: stateless, safe to share
  getIt.registerLazySingleton<GetSongsUseCase>(
    () => GetSongsUseCase(repository: getIt<SongRepository>()),
  );
  getIt.registerLazySingleton<GetSongByIdUseCase>(
    () => GetSongByIdUseCase(repository: getIt<SongRepository>()),
  );

  // ViewModels: hold screen state, a new instance every time
  getIt.registerFactory<HomeViewModel>(
    () => HomeViewModel(useCase: getIt<GetSongsUseCase>()),
  );
  getIt.registerFactory<SongDetailViewModel>(
    () => SongDetailViewModel(useCase: getIt<GetSongByIdUseCase>()),
  );
}
