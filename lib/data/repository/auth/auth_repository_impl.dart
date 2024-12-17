import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:spotify_clone/data/models/auth/create_user_req.dart';
import 'package:spotify_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<void> signin() async {
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      return await GetIt.I<AuthFirebaseService>().signup(createUserReq);
    } catch (e) {
      return Left(e); // or any appropriate Left value
    }
  }
}
