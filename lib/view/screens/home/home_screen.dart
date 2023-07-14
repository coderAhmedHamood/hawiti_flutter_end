import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../main.dart';
import '../../../notifi.dart';
import '../../widgets/Drawer.dart';
import '../../widgets/NavigationBar.dart';
import '../../widgets/header_widget.dart';
import '../birth/request_birth_card_screen.dart';
import '../birth/request_lost_birth_card_screen.dart';
import '../death_request/death_request_screen.dart';
import '../family/request_family_card.dart';
import '../family/request_lost_family_card.dart';
import '../family/request_renew_family_card.dart';
import '../identification_card_request/renew_id_screen.dart';
import '../identification_card_request/request_change_id_data.dart';
import '../identification_card_request/request_lost_id_screen.dart';
import '../identification_card_request/step_1_screen.dart';
import '../identification_card_request/verification_request_screen.dart';
import '../my_family_screen.dart';
import '../my_sevices_screen.dart';
import 'SideMenu.dart';
import 'home_contnet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void onTabTapped(int index) {
    setState(() {
    });
  }

  @override
  void initState() {
    initialMessage();

    super.initState();
    Notifi.initialize(flutterLocalNotificationsPlugin);

    ///on app in foreground

    FirebaseMessaging.onMessage.listen((event) {
      Notifi.showBigTextNotification(
          title: "${event.data["title"]}",
          body: "${event.data['body']}",
          fln: flutterLocalNotificationsPlugin);

      // print("${event.data}");
    });
  }

  initialMessage() async {
    await FirebaseMessaging.instance.subscribeToTopic("test");
    RemoteMessage? message =
        await FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
    } else {}

    ///on app terminated click message
    if (message != null) {
      Notifi.showBigTextNotification(
          title: "${message.data['title']}",
          body: "${message.data['body']}",
          fln: flutterLocalNotificationsPlugin);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.indigo.shade900,
          automaticallyImplyLeading: false),
      endDrawer: MyDrawer(),
      // bottomNavigationBar: const NavBar(),
      body: SingleChildScrollView(
        child: Stack(children: [
          const SizedBox(
            height: 100,
            child: HeaderWidget(100, false, Icons.house_rounded),

          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Column(
              children: [
                Column(children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          width: 0.4, color: Colors.indigo.shade900),
                      color: Colors.indigo.shade900,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.home,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'الصفحة الرئيسية',
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'NotoKufiArabic',
                        color: Colors.indigo.shade900,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ],
            ),
          ),

        ]),
      ),
    );
  }
}
