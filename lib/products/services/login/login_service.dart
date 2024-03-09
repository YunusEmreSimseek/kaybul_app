import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

abstract class ILoginService {
  Future<bool> login({required String email, required String password});
  bool isLoggedIn(User? user);
}

final class LoginService extends ILoginService {
  @override
  Future<bool> login({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } on Exception catch (e) {
      e.toString();
      Logger().e(e.toString());
    }
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    }
    return false;
  }

  @override
  bool isLoggedIn(User? user) {
    if (user == null) return false;
    return true;
  }
}
