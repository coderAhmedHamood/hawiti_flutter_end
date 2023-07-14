import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hawiti/view/screens/add_request_id_card.dart';
import 'package:hawiti/view/screens/auth/login_screen.dart';
import 'package:hawiti/view/screens/auth/register_screen.dart';
import 'package:hawiti/view/screens/home/home_screen.dart';
import 'package:hawiti/view/screens/identification_card_request/request_lost_id_screen.dart';
import 'package:hawiti/view/screens/identification_card_request/step_1_screen.dart';
import 'package:hawiti/view/screens/identification_card_request/update_step_1_screen.dart';
import 'package:hawiti/view/widgets/Drawer.dart';
import 'controllers/common_operatin_controller.dart';
import 'core/dependincies.dart'as dep;
import 'data/api/http_client.dart';
import 'notifi.dart';
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future backgroundMessage (RemoteMessage message) async{
  print("back ground message -----------------------------000000000" );
  Notifi.showBigTextNotification(title: "${
      message.notification?.title
      // message.data['title']
  }", body: "${
      message.notification?.body
      // message.data['body']
  }", fln: flutterLocalNotificationsPlugin);
  print("${message.notification?.title}");
  print("${message.from}");
  print("${message.notification}");
  print("${message.collapseKey}");
}
class PostHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = PostHttpOverrides();

  await dep.init();
  // GetStorage().initStorage();
  await GetStorage.init();

  await  Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundMessage);
  FirebaseMessaging.instance.subscribeToTopic("all");
  final api = Api(); // create an instance of the Api class
  FirebaseMessaging.instance.getToken().then((value) => {
    debugPrint(value),
  });
  Get.find<CommonController>().getAllCountriesData();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '',

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.indigo.shade900,
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(fontSize: 20,color:Colors.black),
        ),
        fontFamily: 'Cairo',

        primarySwatch: Colors.blue,
         inputDecorationTheme: const InputDecorationTheme(
           filled: true, //<-- SEE HERE
          fillColor: Colors.white, //<-- SEE HERE
        ),
      ),

      home:
      // HomeScreen(),
      // updatestepOneScreen(),
      loginScreen(),
      // stepOneScreen(),
      // HomeScreen(),
    );
  }
}

