import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawiti/view/screens/home/SideMenu.dart';
import 'package:hawiti/view/screens/identification_card_request/request_change_id_data.dart';
import 'package:hawiti/view/screens/identification_card_request/step_1_screen.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../birth/request_birth_card_screen.dart';
import '../identification_card_request/choose_operation_id_screen.dart';

class HomeContent extends StatefulWidget {
  HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {

  bool isModeOperation = false;

  int type = 0;

  @override
  Widget build(BuildContext context) {
    return Row();
  }
}
