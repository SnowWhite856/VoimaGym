import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future <bool> authCheck() async {
    bool auth = false;
    await FirebaseAuth.instance
        .idTokenChanges()
        .listen((User? user) {
      user == null ? auth = false : auth = true;
    });
    return Future.value(auth);
  }

  Future <bool> createUser({String? email, String? password, required int type}) async {
    try {
      switch (type) {
        case 1:
          if(email == null || password == null) {
            throw("Email or password is null");
          }
          await auth.createUserWithEmailAndPassword(email: email, password: password).then((value) => print("User created"));
          return(Future.value(true));
        case 2:
          final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

          final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken,
            idToken: googleAuth?.idToken,
          );
          return(Future.value(true));
        case 3:
          return(Future.value(true));
        case 4:
          return(Future.value(true));
        default:
          print("Wrong type");
          return(Future.value(false));
      }
    }
    catch(e)
    {
      print(e);
      return (Future.value(false));
    }
  }
}