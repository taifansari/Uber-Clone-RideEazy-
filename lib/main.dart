import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_app/infoHandler/app_info.dart';
import 'package:users_app/splashScreen/splash_screen.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyC_cKHBUGfrVK1CrEr5jd0NjcQget_lj0Y",
      appId: "1:752159486830:android:19b78f79424cb99657c77f",
      messagingSenderId: "752159486830",
      projectId: "driver-app-1-clone",
    ),
  );


  runApp(
    MyApp(
      child: ChangeNotifierProvider(
        create: (context) => AppInfo(),
        child: MaterialApp(
          title: 'Drivers App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MySplashScreen(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    ),
  );
}



class MyApp extends StatefulWidget
{
  final Widget? child;

  MyApp({this.child});

  static void restartApp(BuildContext context)
  {
    context.findAncestorStateOfType<_MyAppState>()!.restartApp();
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  Key key = UniqueKey();

  void restartApp()
  {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child!,
    );
  }
}



