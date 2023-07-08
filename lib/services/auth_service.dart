import 'package:realm/realm.dart';
import 'package:google_sign_in/google_sign_in.dart';

const List<String> scopes = <String>['email', 'profile', 'openid'];

const String clientId =
    '83247428077-c6tetj0ko92gj0t3s49o3qg21fl8v33f.apps.googleusercontent.com';

class AuthService {
  final _googleSignIn = GoogleSignIn(
    scopes: scopes,
    //clientId: clientId,
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
    final googleAuth = await googleUser!.authentication;
    // googleAuth.accessToken;
    final googleAuthCodeCredentials =
        Credentials.googleAuthCode(googleAuth.accessToken!);
    final user = await app.logIn(googleAuthCodeCredentials);
    return user;
  }

  Future<User> logwithGoogleIdToken() async {
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final googleIdTokenCredentials =
        Credentials.googleIdToken(googleAuth.accessToken!);
    final user = await app.logIn(googleIdTokenCredentials);
    return user;
  }

  User currentUser() {
    final user = app.currentUser;
    return user!;
  }

  Future<void> logOut(User user) async {
    await user.logOut();
  }
}
