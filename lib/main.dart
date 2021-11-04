import 'package:authtest/router.dart';
import 'package:authtest/routing_const.dart';
import 'package:authtest/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  serviceLocatorSetup();
  await Hive.initFlutter();
  await Hive.openBox('token');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Box tokenBox = Hive.box('token');
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(elevation: 0.1),
        scaffoldBackgroundColor: Color(0xFFF3F1F1),
      ),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AuthRoute,
    );
  }
}
