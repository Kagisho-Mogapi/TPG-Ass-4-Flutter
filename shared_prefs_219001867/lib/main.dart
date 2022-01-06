import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_prefs_219001867/models/profile_theme.dart';
import 'package:shared_prefs_219001867/pages/loadingScreen.dart';
import 'package:shared_prefs_219001867/routes/routes.dart';

import 'models/btn_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Themes(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileTheme(),
        ),
      ],
      child: Consumer<Themes>(
        builder: (context, value, child) {
          return value.doneLoading
              ? MaterialApp(
                  initialRoute: RouteManager.profile,
                  onGenerateRoute: RouteManager.generateRoute,
                )
              : LoadingScreen(context: context);
        },
      ),
    );
  }
}
