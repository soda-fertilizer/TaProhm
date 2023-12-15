import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class TaProhmAuthUser {
  TaProhmAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<TaProhmAuthUser> taProhmAuthUserSubject =
    BehaviorSubject.seeded(TaProhmAuthUser(loggedIn: false));
Stream<TaProhmAuthUser> taProhmAuthUserStream() => taProhmAuthUserSubject
    .asBroadcastStream()
    .map((user) => currentUser = user);
