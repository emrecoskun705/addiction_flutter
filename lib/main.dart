import 'package:addiction_app/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: 'AIzaSyBUQymIPLN_gHxbm5I3L4S1QRR2D_Vkth4',
            authDomain: 'addictionapp-34d0e.firebaseapp.com',
            storageBucket: 'addictionapp-34d0e.appspot.com',
            appId: '1:609546172631:web:edde6f3ba4cd640c605892',
            messagingSenderId: '609546172631',
            projectId: 'addictionapp-34d0e'));
  }
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.light(),
        home: kIsWeb
            ? LoginScreen()
            : FutureBuilder(
                future: Firebase.initializeApp(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Container(
                      child: Text('sadfsadsaaa'),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    return LoginScreen();
                  }
                  return Container(
                    child: Text('sadfsadsa'),
                  );
                },
              ));
  }
}
