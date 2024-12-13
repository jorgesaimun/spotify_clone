import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/data/models/auth/create_user_req.dart';
import 'package:dartz/dartz.dart';

abstract class AuthFirebaseService {
  Future<void> signin();
  Future<Either> signup(CreateUserReq createUserReq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<void> signin() async {
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );
      return const Right('User created successfully');
    } on FirebaseException catch (e) {
      print(e);
      return const Left('Error creating user');
    }
  }
}
