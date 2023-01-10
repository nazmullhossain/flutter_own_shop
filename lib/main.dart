import 'package:flutter/material.dart';
import 'package:flutter_ecomer_riv/provider/user_provider.dart';
import 'package:flutter_ecomer_riv/router.dart';
import 'package:provider/provider.dart';

import 'const/global_varriable.dart';
import 'features/auth/auth_screen.dart';

void main() {
  runApp(MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context)=>UserProvider()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backGroundColor,
        colorScheme: ColorScheme.light(
          primary: GlobalVariables.secondaryColor
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black
          )
        )
      ),
      onGenerateRoute: (settings)=>generateRoute(settings),
      home: AuthScreen(),
    );
  }
}
