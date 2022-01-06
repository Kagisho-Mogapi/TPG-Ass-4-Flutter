import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_prefs_219001867/models/btn_theme.dart';
import 'package:shared_prefs_219001867/models/profile_theme.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        backgroundColor: Colors.purple[400],
        title: Text(
          'Settings',
          style: GoogleFonts.lobster(),
        ),
      ),
      body: Column(
        children: [
          Card(
            color: Colors.purple[400],
            child: Consumer<Themes>(
              builder: (context, value1, child) {
                return SwitchListTile(
                  contentPadding: EdgeInsets.all(10),
                  title: Text(
                    'App buttons rounded',
                    style: GoogleFonts.lobster(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                  value: value1.isRoundBtns,
                  onChanged: (value2) {
                    value1.toggleBtnShape();
                  },
                );
              },
            ),
          ),
          Consumer<Themes>(
            builder: (context, value, child) {
              return Card(
                color: Colors.purple[400],
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Choose layout',
                        style: GoogleFonts.lobster(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //====================================================================
                        ProfileBtns(title: 'Pic on left'),
                        //====================================================================
                        ProfileBtns(title: 'Pic on right'),
                        //====================================================================
                        ProfileBtns(title: 'Pic at top'),
                        //====================================================================
                      ],
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class ProfileBtns extends StatelessWidget {
  const ProfileBtns({Key? key, @required this.title}) : super(key: key);

  final title;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileTheme>(
      builder: (context, value, child) {
        return ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(btnColor(title)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: roundBtn,
              ),
            ),
          ),
          onPressed: () {
            value.onBtnPress(title);
          },
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              title,
              style: GoogleFonts.lobster(
                fontSize: 17,
              ),
            ),
          ),
        );
      },
    );
  }
}

Color? btnColor(String id) {
  Color? color = Colors.green;

  if (id == profileScheme) {
    color = Colors.red;
  }

  return color;
}
