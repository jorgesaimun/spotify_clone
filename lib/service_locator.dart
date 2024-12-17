import 'package:get_it/get_it.dart';
import 'package:spotify_clone/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';
import 'package:spotify_clone/domain/usecases/auth/signup.dart';

Future<void> initializeDependecies() async {
  GetIt.I
    ..registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl())
    ..registerSingleton<AuthRepository>(AuthRepositoryImpl())
    ..registerSingleton<SignupUseCase>(SignupUseCase());
}
