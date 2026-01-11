import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithGoogle() async {
    try {
      // 1. Trigger Google Sign-In popup
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      // 2. Get Google Auth Details
      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      // 3. Create Firebase credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // 4. Sign in with Firebase
      UserCredential userCredential =
      await _auth.signInWithCredential(credential);

      return userCredential.user;

    } catch (e) {
      print("Google Sign-In Error: $e");
      return null;
    }
  }

  Future<bool> signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    return  true;
  }
}