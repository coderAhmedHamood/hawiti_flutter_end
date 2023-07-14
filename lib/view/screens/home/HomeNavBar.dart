import 'package:flutter/material.dart';

import '../../widgets/Drawer.dart';
import '../../widgets/NavigationBar.dart';

class HomeNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavBar(),
      body: Container(),

    );
  }
}
