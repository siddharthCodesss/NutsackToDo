import 'package:get_it/get_it.dart';
import '../network_sensitive/cubit/internet_cubit.dart';

final sl = GetIt.instance;

void init() {
  /*sl.registerLazySingleton<InternetCubit>(() {
    final cubit = InternetCubit();
    cubit.connectionStatus();
    return cubit;
  });*/
  // sl.registerLazySingleton<InternetCubit>(() => InternetCubit());
  // sl.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper.instance);
  // sl.registerFactory<SplashCubit>(() => SplashCubit());
}
