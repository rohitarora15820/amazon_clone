import 'package:amazon_clone_frontend/common/widgets/bottom_bar.dart';
import 'package:amazon_clone_frontend/constants/global_variables.dart';
import 'package:amazon_clone_frontend/features/admin/screens/admin_screen.dart';
import 'package:amazon_clone_frontend/features/auth/screens/auth_screens.dart';
import 'package:amazon_clone_frontend/features/auth/services/auth_services.dart';
import 'package:amazon_clone_frontend/features/home_screen/screens/home_screen.dart';
import 'package:amazon_clone_frontend/providers/user_provider.dart';
import 'package:amazon_clone_frontend/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthServices authServices = AuthServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authServices.getUserData(context: context);
  }

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
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? Provider.of<UserProvider>(context).user.type == "user"
                ? const BottomBar()
                : const AdminScreen()
            : const AuthScreen());
  }
}
