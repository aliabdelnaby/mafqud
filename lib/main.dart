import 'package:flutter/material.dart';
import 'package:mafqud/core/router/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mafqud',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
