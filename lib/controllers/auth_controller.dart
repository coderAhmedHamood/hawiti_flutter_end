import 'dart:convert';
import 'dart:io';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:developer' as developer;

// import 'package:http/http.dart'as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:device_info_plus/device_info_plus.dart';

import '../core/functions/functions.dart';
import '../data/api/http_client.dart';
import '../model/device_model.dart';
import '../model/user_model.dart';
import '../view/screens/home/HomeNavBar.dart';
import '../view/screens/home/home_screen.dart';
import 'BaseController.dart';

class AuthController extends GetxController with BaseController {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  var nameCon = TextEditingController();
  var emailCon = TextEditingController();
  var passwordCon = TextEditingController();
  var personIdCon = TextEditingController();
  var phoneCon = TextEditingController();
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  var pushToken;
  bool isLoad = false;
  bool isPasswordHidden = true;

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    update();
  }

  final api = Api();

  @override
  void onInit() {
    super.onInit();
    firebaseMessaging.getToken().then((toke) {
      pushToken = toke;
    });
    print('psuhtoken');
    print(pushToken);
  }

  Future<void> login() async {
    showLoading();
    final email = emailCon.text;
    final password = passwordCon.text;
    // var url = 'https://topsoftp.com/hawiti/api/login';
    final response = await api.post('login', {
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200) {
      var sucsses = jsonDecode(response.body);
      var token = sucsses['token'];
      closLoading();
      print(sucsses);
      print(token);
      print("token");
      await GetStorage().write('token', token);
      GetStorage().write('login', true);
      api.setToken(token.toString());
      Get.offAll(() =>  HomeNavBar());
      var uuid = const Uuid().v4();
      String? deviceId = await PlatformDeviceId.getDeviceId;
      print('deviceId');
      print(deviceId);
      DeviceModel deviceModel;
      Future.delayed(const Duration(seconds: 0), () async {
        if (Platform.isAndroid) {
          deviceModel = DeviceModel(
              name: '',
              uuid: deviceId ?? "",
              pushToken: '',
              platform: '',
              platformVersion: '',
              version: '');
          AndroidDeviceInfo info = await deviceInfoPlugin.androidInfo;
          PackageInfo packageInfo = await PackageInfo.fromPlatform();
          deviceModel.platform = Platform.operatingSystem;
          deviceModel.name = info.model;
          deviceModel.platformVersion = info.version.release;
          deviceModel.uuid = deviceId ?? "";
          deviceModel.pushToken = pushToken.toString();
          deviceModel.longitude = "0.0";
          deviceModel.latitude = "0.0";
          deviceModel.version = packageInfo.buildNumber;
          addNewDevice(deviceModel);
        } else if (Platform.isIOS) {
          deviceModel = DeviceModel(
              name: '',
              uuid: uuid,
              pushToken: '',
              platform: '',
              platformVersion: '',
              version: '');
          IosDeviceInfo info = await deviceInfoPlugin.iosInfo;
          PackageInfo packageInfo = await PackageInfo.fromPlatform();
          deviceModel.platform = Platform.operatingSystem;
          deviceModel.name = info.model!;
          deviceModel.platformVersion = info.utsname.release.toString();
          deviceModel.uuid = uuid;
          deviceModel.pushToken = pushToken.toString();
          deviceModel.longitude = "0.0";
          deviceModel.latitude = "0.0";
          deviceModel.version = packageInfo.version;
          addNewDevice(deviceModel);
        }
      });
    } else {
      closLoading();
      var message = jsonDecode(response.body)['message'];
      showError(message);
      // handleError(response.body);
    }
  }
  addNewDevice(DeviceModel device) async {
    final api = Api();
    print('add device function');
String userid=await getUserId();
    print('userid');
    print(userid);
    final response = await api.post('device/add', {
      "name": device.name,
      "version": device.version,
      "platform": device.platform,
      "platformVersion": device.platformVersion,
      "token": device.pushToken,
      "uuid": device.uuid,
      "user_id": userid,
      "latitude": device.latitude,
      "longitude": device.longitude,
    });
    print("add device");
    // print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
    } else {}
  }

   Future<String>getUserId() async {
    final api = Api();
    final response = await api.get('user');
    print("getUser");
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      var data=jsonDecode(response.body);
      UserModel user=UserModel.fromJson(data);
      return user.id.toString();
      print(response.body);
    } else {
      return "";
    }
  }

  Future<void> register() async {
    showLoading();
    final name = nameCon.text;
    final email = emailCon.text;
    final password = passwordCon.text;
    final phone = phoneCon.text;
    var url = 'https://topsoftp.com/hawiti/api/register';
    final response = await api.post('register', {
      'name': name,
      'email': email,
      'password': password,
      'c_password': password,
    });
    if (response.statusCode == 200) {
      closLoading();
      var sucsses = jsonDecode(response.body)['success'];
      var token = sucsses['token'];
      closLoading();
      print(token);
      print("token");
      GetStorage().write('token', token);
      GetStorage().write('login', true);
      api.setToken(token.toString());
      var uuid = const Uuid().v4();
      DeviceModel deviceModel;
      Future.delayed(const Duration(seconds: 0), () async {
        if (Platform.isAndroid) {
          deviceModel = DeviceModel(
              name: '',
              uuid: uuid.toString(),
              pushToken: '',
              platform: '',
              platformVersion: '',
              version: '');
          AndroidDeviceInfo info = await deviceInfoPlugin.androidInfo;
          PackageInfo packageInfo = await PackageInfo.fromPlatform();
          deviceModel.platform = Platform.operatingSystem;
          deviceModel.name = info.model;
          deviceModel.platformVersion = info.version.release;
          deviceModel.uuid = uuid;
          deviceModel.pushToken = pushToken.toString();
          deviceModel.longitude = "0.0";
          deviceModel.latitude = "0.0";
          deviceModel.version = packageInfo.buildNumber;
          addNewDevice(deviceModel);
        } else if (Platform.isIOS) {
          deviceModel = DeviceModel(
              name: '',
              uuid: uuid,
              pushToken: '',
              platform: '',
              platformVersion: '',
              version: '');
          IosDeviceInfo info = await deviceInfoPlugin.iosInfo;
          PackageInfo packageInfo = await PackageInfo.fromPlatform();
          deviceModel.platform = Platform.operatingSystem;
          deviceModel.name = info.model!;
          deviceModel.platformVersion = info.utsname.release.toString();
          deviceModel.uuid = uuid;
          deviceModel.pushToken = pushToken.toString();
          deviceModel.longitude = "0.0";
          deviceModel.latitude = "0.0";
          deviceModel.version = packageInfo.version;
          addNewDevice(deviceModel);
        }
      });

      print(response.body);
    } else {
      closLoading();

      print(response.body);
      var message = jsonDecode(response.body)['error'];
      // var email=message['email'];
      // showError(email);
      // handleError(response.body);
      // var res=   response.body;
      // res.
      //  flutter: {"error":{"email":["The email has already been taken."]}}
      //  show error message

      // var  res=  JsonEncoder(response.body['error'].toString());
//   get response body and get error message

// print(res);
    }
  }

// void savePersonId(String personId) {
//   SharedPreferences.getInstance().then((prefs) {
//     prefs.setString(Constants.personIdKey, personId);
//   });
// }
//
// void loadPersonId() {
//   SharedPreferences.getInstance().then((prefs) {
//     String? personId = prefs.getString(Constants.personIdKey);
//     if (personId != null) {
//       personIdCon.text = personId;
//     }
//   });
// }
//
// void dispose() {
//   personIdCon.dispose();
// }
}
