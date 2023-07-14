import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:hawiti/view/screens/read_qr.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../SharedPreferences.dart';
import '../screens/home/SideMenu.dart';
import '../screens/home/home_screen.dart';
import '../screens/identification_card_request/verification_request_screen.dart';
import '../screens/my_family_screen.dart';
import '../screens/my_sevices_screen.dart';
import 'Drawer.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 1;

  final List<Widget> _pages = [ReadQR(),HomeScreen(),MyServiceScreen()];
  // final List<Widget> _pages = [
  //   // VerificationRequestScreen()
  // ReadQR()
  //   , HomeScreen(), MyServiceScreen()];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(20),
              child: AppBar(
          )
    ),
      backgroundColor: Colors.black,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,

        color:Colors.indigo ,
        items: const <Widget>[

          Icon(Icons.note_add_sharp , size: 30, color: Colors.white),
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.family_restroom_outlined, size: 30, color: Colors.white),


        ],
        onTap: (index) {
          setState(()  {
            currentIndex = index;
          });
        },
      ),
      body: _pages[currentIndex],
    );
  }

}
