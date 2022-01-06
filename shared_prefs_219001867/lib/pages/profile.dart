import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_prefs_219001867/models/btn_theme.dart';
import 'package:shared_prefs_219001867/models/profile_theme.dart';
import 'package:shared_prefs_219001867/routes/routes.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      body: Column(
        children: [
          Card(
            color: Colors.purple,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Profile',
                    style: GoogleFonts.lobster(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                FloatingActionButton(
                  elevation: 0,
                  backgroundColor: Colors.purple,
                  onPressed: () {
                    Navigator.of(context).pushNamed(RouteManager.settigns);
                  },
                  child: Icon(Icons.settings),
                )
              ],
            ),
          ),
          SizedBox(height: 15),
          // !!!!!!!!!!!!!!!!!--------------------------Pic Theme
          Consumer<ProfileTheme>(
            builder: (context, value, child) => choosenScheme(),
          ),
          SizedBox(height: 15),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              //====================================================================
              bottomBtns('Mobile', Icon(Icons.call)),
              //====================================================================
              bottomBtns('Mail', Icon(Icons.mail)),
              //====================================================================
            ],
          )
        ],
      ),
    );
  }

  ElevatedButton bottomBtns(String txt, Icon icon) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.green),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: roundBtn),
        ),
      ),
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            icon,
            SizedBox(width: 5),
            Text(
              txt,
              style: GoogleFonts.lobster(
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PicOnLeft extends StatelessWidget {
  const PicOnLeft({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Container(
            child: CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                  'https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2020/06/black-woman-fashion-photo.jpg?w=750'),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: new Border.all(
                color: Colors.white,
                width: 3.0,
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          children: [
            Text(
              'Joyce',
              style: GoogleFonts.lobster(
                fontSize: 60,
                color: Colors.white,
              ),
            ),
            Text(
              'Makhaba',
              style: GoogleFonts.lobster(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class PicAtTop extends StatelessWidget {
  const PicAtTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Container(
            child: CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                  'https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2020/06/black-woman-fashion-photo.jpg?w=750'),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: new Border.all(
                color: Colors.white,
                width: 3.0,
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        Text(
          'Joyce',
          style: GoogleFonts.lobster(
            fontSize: 60,
            color: Colors.white,
          ),
        ),
        Text(
          'Makhaba',
          style: GoogleFonts.lobster(
            fontSize: 40,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class PicOnRight extends StatelessWidget {
  const PicOnRight({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              Text(
                'Joyce',
                style: GoogleFonts.lobster(
                  fontSize: 60,
                  color: Colors.white,
                ),
              ),
              Text(
                'Makhaba',
                style: GoogleFonts.lobster(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 20),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            child: CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                  'https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2020/06/black-woman-fashion-photo.jpg?w=750'),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: new Border.all(
                color: Colors.white,
                width: 3.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget choosenScheme() {
  Widget widget;

  if (profileScheme == 'Pic on left') {
    widget = PicOnLeft();
  } else if (profileScheme == 'Pic on right') {
    widget = PicOnRight();
  } else {
    widget = PicAtTop();
  }
  return widget;
}
