import 'package:spotify_clone/data/models/auth/create_user_req.dart';

abstract class AuthFirebaseService {
  Future<void> signin();
  Future<void> signup(CreateUserReq createUserReq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<void> signin() async {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<void> signup(CreateUserReq createUserReq) async {
    // TODO: implement signup
    throw UnimplementedError();
  }
}
