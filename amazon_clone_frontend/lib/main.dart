import 'package:amazon_clone_frontend/constants/global_variables.dart';
import 'package:amazon_clone_frontend/features/auth/screens/auth_screens.dart';
import 'package:amazon_clone_frontend/providers/user_provider.dart';
import 'package:amazon_clone_frontend/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
     providers: [
       ChangeNotifierProvider(create: (context) => UserProvider(),)
     ], 
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazon Clone',
      onGenerateRoute: (settings) => generateRoute(settings),
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        appBarTheme: const AppBarTheme(
            elevation: 0, iconTheme: IconThemeData(color: Colors.black)),
        // useMaterial3: true,
        colorScheme:
            const ColorScheme.light(primary: GlobalVariables.secondaryColor),
      ),
      home: const AuthScreen()
    );
  }
}
