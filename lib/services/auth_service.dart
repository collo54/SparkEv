import 'package:realm/realm.dart';
import 'package:google_sign_in/google_sign_in.dart';

const List<String> scopes = <String>['email', 'profile', 'openid'];
// 'openid'

const String clientId =
    '83247428077-6ja72eae9lis4nedri1i4tu0uj06tk5j.apps.googleusercontent.com';

class AuthService {
  final _googleSignIn = GoogleSignIn(
    scopes: scopes,
    clientId: clientId,
  );
  final app = App(AppConfiguration('spark-ev-app-fltii'));

  Future<User> logInAnonymouly() async {
    final user = await app.logIn(Credentials.anonymous());
    return user;
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    EmailPasswordAuthProvider authProvider = EmailPasswordAuthProvider(app);
    await authProvider.registerUser(email, password);
  }

  Future<User> logwithEmailAndPassword(String email, String password) async {
    final emailPwCredentials = Credentials.emailPassword(email, password);
    final user = await app.logIn(emailPwCredentials);
    return user;
  }

  Future<User> logwithJWT(String token) async {
    final jwtCredentials = Credentials.jwt(token);
    final user = await app.logIn(jwtCredentials);
    return user;
  }

  Future<User> logwithGoogleAuthCode() async {
    final googleUser = await _googleSignIn.signIn();
    // final googleCode = googleUser!.serverAuthCode!;
    final googleAuth = await googleUser!.authentication;
    final user =
        await app.logIn(Credentials.googleAuthCode(googleAuth.accessToken!));

    return user;
  }

  Future<User> logwithGoogleIdToken() async {
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;

    final user =
        await app.logIn(Credentials.googleIdToken(googleAuth.idToken!));

    return user;
  }

  User? currentUser() {
    final user = app.currentUser;
    return user;
  }

  Future<void> logOut(User user) async {
    await user.logOut();
  }
}
