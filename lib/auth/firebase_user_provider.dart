import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class GlobalLibraryUsersFirebaseUser {
  GlobalLibraryUsersFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

GlobalLibraryUsersFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<GlobalLibraryUsersFirebaseUser> globalLibraryUsersFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<GlobalLibraryUsersFirebaseUser>(
      (user) {
        currentUser = GlobalLibraryUsersFirebaseUser(user);
        return currentUser!;
      },
    );
