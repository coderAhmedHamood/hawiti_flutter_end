import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hawiti/view/screens/identification_card_request/request_change_id_data.dart';
import 'package:hawiti/view/screens/identification_card_request/request_lost_id_screen.dart';
import 'package:hawiti/view/screens/identification_card_request/step_1_screen.dart';
import 'package:hawiti/view/screens/identification_card_request/step_2_screen.dart';

import '../add_request_id_card.dart';
import '../birth/request_birth_card_screen.dart';
import '../birth/request_lost_birth_card_screen.dart';
import '../family/request_family_card.dart';
import '../family/request_lost_family_card.dart';
import '../family/request_renew_family_card.dart';
import '../identification_card_request/renew_id_screen.dart';
import '../identification_card_request/verification_request_screen.dart';
import '../my_family_screen.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            ],
          ),
        ));
  }

}
