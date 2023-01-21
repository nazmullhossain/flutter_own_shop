import 'package:flutter/material.dart';
import 'package:flutter_ecomer_riv/pages/home_pages.dart';
import 'package:flutter_ecomer_riv/provider/user_provider.dart';
import 'package:flutter_ecomer_riv/router.dart';
import 'package:flutter_ecomer_riv/services/auth_services.dart';
import 'package:flutter_ecomer_riv/widgets/bottom_bar-widgets.dart';
import 'package:provider/provider.dart';

import 'admin/pages/admin_page.dart';
import 'const/global_varriable.dart';
import 'features/auth/auth_screen.dart';

void main() {
  runApp(MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context)=>UserProvider()),
      ],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthServices authServices=AuthServices();
  @override
  void initState() {
    // TODO: implement initState
    authServices.getUserData(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backGroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black
          )
        )
      ),
      onGenerateRoute: (settings)=>generateRoute(settings),
      home:Provider.of<UserProvider>(context).user.token.isNotEmpty?
      Provider.of<UserProvider>(context).user.type=="user"? AdminPage():BottomBarWidget()
          :const AuthScreen(),
    );
  }
}
