import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_prefs_219001867/models/btn_theme.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key, required this.context}) : super(key: key);
  final BuildContext context;

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await Future.delayed(Duration(seconds: 3));
    widget.context.read<Themes>().doneLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/tpg_logo.png',
                scale: 4,
              ),
              Text(
                'Getting things in order please wait',
                style: GoogleFonts.lobster(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
