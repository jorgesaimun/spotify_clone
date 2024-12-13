import 'package:get_it/get_it.dart';
import 'package:spotify_clone/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone/domain/repository/auth.dart';

final s1 = GetIt.instance;

Future<void> initializeDependecies() async {

  s1.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  s1.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  
}
