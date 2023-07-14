import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/functions/functions.dart';
import '../data/api/http_client.dart';
import '../model/request_verify_data_model.dart';
import '../models/request_id_model.dart';
import '../view/screens/identification_card_request/show_verification_data.dart';
import 'BaseController.dart';

class VerifyController extends GetxController with BaseController {
  var verifyData = RequestVerifyDataModel.empty();

  // var verifyData= VerificationRequsetData.empty();
  TextEditingController personId = TextEditingController();
  TextEditingController requestId = TextEditingController();
  TextEditingController requestCode = TextEditingController();
  TextEditingController requestCodeId = TextEditingController();

  Future<void> addVerify(String code) async {
    // try {
      // showLoading();
      final api = Api(); // create an instance of the Api class
      print('start request verify');
      print(code);
      personId.text = "11111111";
      final response = await api.post('check', {
        'barcode': code,
      });

      if (response.statusCode == 200) {
        closLoading();
        var success = jsonDecode(response.body);
        print(success);
        // verifyData= VerificationRequsetData.fromJson(success);
        verifyData = RequestVerifyDataModel.fromJson(success);
        showSuccessSnack('تم ارسال الطلب بنجاح');
        // requestCodeId.text=verifyData.checkId.toString();
        //todo get the id of request and show in page response
        print(response.body);
        print('Request sent successfully');
        // print(response.body);
        Get.off(ShowVerificationDataScreen());
        update();
        // Data successfully sent to API
      } else {
        closLoading();
        print('Request error');
        print(response.body);
        showError(response.toString());
        //todo show error message
        // Handle error response
      }
    // } catch (e) {
    //   print(e.toString());
    //   closLoading();
    // }
  }

  Future<void> verifyCodeCheck() async {
    // try {
      showLoading();
      final api = Api(); // create an instance of the Api class
      print('start verifyCode');
      String id = requestCodeId.text;
      String code = requestCode.text;
      final response = await api.post('verifyCode/$id/$code', {});

      if (response.statusCode == 200) {
        closLoading();
        var success = jsonDecode(response.body);
        showSuccessSnack(success['msg']);

        print(response.body);
        print('Request sent successfully');
        // print(response.body);
        Get.to(ShowVerificationDataScreen());
        // Data successfully sent to API
      } else {
        closLoading();
        print('Request error');
        print(response.body);
        showError(response.toString());
        //todo show error message
        // Handle error response
      }
    // } catch (e) {
    //   print(e.toString());
    //   closLoading();
    // }
  }

  Future<void> addVerifyWith2Image(
      String barcode, String fImage, String bImage) async {
    showLoading();
    late String _token = '';
    _token = GetStorage().read('token') ?? "";
    const String _baseUrl = 'http://192.168.0.147/hawiti_end/api/verifyCode';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $_token',
      "Accept": 'application/json',
    };
    var request = http.MultipartRequest('POST', Uri.parse(_baseUrl))
      ..fields.addAll({
        "barcode": barcode,
      })
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('f_image', fImage))
      ..files.add(await http.MultipartFile.fromPath('b_image', bImage));
    var response = await request.send();
    // request.
        // .then((result) => {
    // http.Response.fromStream(result)
    //     .then((response) {
    // if (response.statusCode == 200)
    // {
    //   closLoading();
    // print("Uploaded! ");
    // print('response.body '+response.body);
    // }else{
    //
    // }
    //
    // })}).catchError((err) => print('error : '+err.toString()))
    //     .whenComplete(()
    // {
    //   closLoading();
    //
    // });
    if (response.statusCode == 200) {
      // return true;
      print("response.stream.toString()");
      print(response.stream
          .transform(utf8.decoder)
          .transform(json.decoder)
          .first);
      closLoading();
      showSuccessSnack('تم ارسال الطلب بنجاح');

      // print(response.stream.toStringStream().first);
    } else {
      // return false;
      print("+++++++++++FFFFFfffffffffff");
      print(response.statusCode);
      // print(response.reactive.);
      print(response.reasonPhrase);
      response.stream.listen((value){
        print(value);
      });
      // print(response.obs.);
      closLoading();
    }
  }
}
