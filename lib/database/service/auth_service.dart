import 'package:firebase_auth/firebase_auth.dart';
import 'package:mylibrary/Screens/helper/helper/sharepreference.dart';
import 'package:mylibrary/database/service/database_service.dart';

enum UserCredentialConstant { user, admin, error }

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

//login
  Future<UserCredentialConstant> loginUserAccount(
      String email, String password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;
      // ignore: unnecessary_null_comparison
      if (user != null && user.uid == 'a7yHUoAZumdLU2RGkninT4Abvhx1') {
        return UserCredentialConstant.admin;
      } else {
        return UserCredentialConstant.user;
      }
    } on FirebaseAuthException {
      return UserCredentialConstant.error;
    }
  }

  Future registerUserWithEmailandPassword(
      String fullName, String email, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;
      // ignore: unnecessary_null_comparison
      if (user != null) {
        await Databaseservice(uid: user.uid).updateUserData(fullName, email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e;
    }
  }

  Future signOut() async {
    try {
      await SharedPreferenceClass.saveUserLoggedInStatus(true);
      await SharedPreferenceClass.saveusername("");
      await SharedPreferenceClass.savepassword("");
      await SharedPreferenceClass.savephonenumber("");
      await firebaseAuth.signOut();
      // ignore: empty_catches
    } catch (e) {}
  }
}
