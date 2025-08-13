import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_copy_v1/data/models/auth/create_user_req.dart';
import 'package:spotify_copy_v1/domain/entities/auth/user.dart';

import '../../../core/constants/app_urls.dart';
import '../../models/auth/signin_user_req.dart';
import '../../models/auth/user.dart';

abstract class AuthFirebaseServiceAbstract {
  Future<Either> signup(CreateUserReq createUserReq);

  Future<Either> signin(SigninUserReq signinUserReq);

  Future<Either> getUser();
}

class AuthFirebaseService implements AuthFirebaseServiceAbstract {
  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      UserCredential data =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );

      FirebaseFirestore.instance.collection("Users").doc(data.user?.uid).set(
        {"name": createUserReq.fullName, "email": data.user?.email},
      );
      return const Right("Signup was Successful");
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == "weak-password") {
        message = "The password provided is too weak.";
      } else if (e.code == "email-already-in-use") {
        message = "The account already exists for that email.";
      } else {
        message = "An unknown error occurred.";
      }

      return Left(message);
    }
  }

  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserReq.email,
        password: signinUserReq.password,
      );

      return const Right("Signin was Successful");
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == "user-not-found") {
        message = "No user found for that email.";
      } else if (e.code == "wrong-password") {
        message = "Wrong password provided for that user.";
      } else if (e.code == "invalid-email") {
        message = "The email address is not valid.";
      } else if (e.code == "invalid-login-credentials") {
        message = "Invalid login credentials.";
      } else {
        message = "An unknown error occurred.";
      }

      return Left(message);
    }
  }

  @override
  Future<Either> getUser() async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      var user = await firebaseFirestore
          .collection("Users")
          .doc(firebaseAuth.currentUser?.uid)
          .get();

      UserModel userModel = UserModel.fromJson(user.data()!);
      userModel.imageURL =
          firebaseAuth.currentUser?.photoURL ?? AppURLs.defaultImage;
      ;

      UserEntity userEntity = userModel.toEntity();

      return Right(userEntity);
    } catch (e) {
      return Left("An error occurred while fetching user data: $e");
    }
  }
}
