import 'package:amazon_clone_node_js_flutter_app_new/constants/global_variable.dart';
import 'package:amazon_clone_node_js_flutter_app_new/features/admin/screens/admin.dart';
import 'package:amazon_clone_node_js_flutter_app_new/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone_node_js_flutter_app_new/features/auth/services/auth_service.dart';
import 'package:amazon_clone_node_js_flutter_app_new/providers/user_provider.dart';
import 'package:amazon_clone_node_js_flutter_app_new/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/widgets/bottom_bar.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final AuthService authService = AuthService();
  @override
  void initState() {
    // TODO: implement initState


    super.initState();
    authService.getUserData(context);

  }
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Amazon Clone',
        theme: ThemeData(
          // scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme: const ColorScheme.light(
            primary: GlobalVariables.secondaryColor,
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? Provider.of<UserProvider>(context).user.type == 'user'? const BottomBar() : const AdminScreen()
            : const AuthScreen(),
      
      ),
    );
  }
}
