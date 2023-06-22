import 'package:firebase_auth/firebase_auth.dart';

Future accountAuth(String email, String password) async {
  final auth = FirebaseAuth.instance;
  await auth.signInWithEmailAndPassword(email: email, password: password);

  return null;
}
