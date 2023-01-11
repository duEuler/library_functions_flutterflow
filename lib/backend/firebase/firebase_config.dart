import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDqiN0QfKpjoY0526c56j5-qoDb7pa0Gc8",
            authDomain: "dueulerpadrao.firebaseapp.com",
            projectId: "dueulerpadrao",
            storageBucket: "dueulerpadrao.appspot.com",
            messagingSenderId: "1060922084072",
            appId: "1:1060922084072:web:75c0460ee9460d3f3e975d"));
  } else {
    await Firebase.initializeApp();
  }
}
