part of google_signin;

class GoogleSignInHelper {
  Future<dynamic> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          return ResponseModel(
              response: null,
              error: "account exists with different credential");

          // handle the error here
        } else if (e.code == 'invalid-credential') {
          return ResponseModel(response: null, error: "invalid credential");
          // handle the error here
        }
      } catch (e) {
        // handle the error here
        return e.toString();
      }
    }

    return ResponseModel(response: user, error: null);
  }

  Future<String> signOut({required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.signOut();
      return "Signed out successfully";
    } catch (e) {
      return "Error signing out. Try again.";
    }
  }
}
