 import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart'as http;

import '../core/functions/functions.dart';
import '../data/api/http_client.dart';
import '../data/country_response.dart';
import '../model/country_model.dart';
import '../model/device_model.dart';
import 'BaseController.dart';
class CommonController extends GetxController with BaseController {
  var nameCon = TextEditingController();
  var emailCon = TextEditingController();
  var passwordCon = TextEditingController();
  var phoneCon = TextEditingController();
  final List<CountryModel> countryList = [];
  late List<Country> country=[];
  Future<void> checkIdNumber() async {
// showLoading();
    showLoading();
    final email = emailCon.text;
    final password = passwordCon.text;
    var url = 'https://topsoftp.com/hawiti/api/login';
    final response = await http.post(Uri.parse(url), body: {
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200) {
      var sucsses=jsonDecode(response.body)['success'];
      var token= sucsses['token'];
      closLoading();
      print(token);
    } else {
      closLoading();

      var message=jsonDecode(response.body)['message'];
      showError(message);
      // handleError(response.body);
    }

  }
  Future<void> checkExpireDateId() async {

    final name = nameCon.text;
    final email = emailCon.text;
    final password = passwordCon.text;
    final phone = phoneCon.text;
    var url = 'https://topsoftp.com/hawiti/api/register';
    final response = await http.post(Uri.parse(url), body: {
      'name': name,
      'email': email,
      'password': password,
      'c_password': password,
    });
    if (response.statusCode == 200) {
      // GetStorage().write('login',true);
var sucsses=jsonDecode(response.body)['success'];
var token= sucsses['token'];
print(token);

print(response.body);
    } else {

      print(response.body);
      var message=jsonDecode(response.body)['message'];

      showError(message);
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
  Future<void> getAllBranchesData() async {

    final name = nameCon.text;
    final email = emailCon.text;
    final password = passwordCon.text;
    final phone = phoneCon.text;
    var url = 'https://topsoftp.com/hawiti/api/register';
    final response = await http.post(Uri.parse(url), body: {
      'name': name,
      'email': email,
      'password': password,
      'c_password': password,
    });
    if (response.statusCode == 200) {
      // GetStorage().write('login',true);
var sucsses=jsonDecode(response.body)['success'];
var token= sucsses['token'];
print(token);

print(response.body);
    } else {

      print(response.body);
      var message=jsonDecode(response.body)['message'];

      showError(message);
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
  Future<void> getAllCountriesData() async {
    final api = Api(); // create an instance of the Api class
print('start get countries');
    GetStorage().remove('countries');

    if(isDataExist('countries')){

      print('start get countries from storage');

      var jsonList=  getData('countries');
      var res= CountryResponse.fromJson(jsonList);
      print(res.countries.length);
      countryList.clear();
      country.clear();
      country.addAll(res.countries);
      // country=Country.fromJson(jsonList[0]);
      // for (final json in jsonList) {
      //   print('in foreach');
      //   print(json);
      //   countryList.add(CountryModel.fromJson(json));
      // }
      GetStorage().remove('countries');
      print('end get countries from storage');

    }
    else {
      final response = await api.get('Country');
      print(response.body);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        print("country response");
       var res= CountryResponse.fromJson(json);
       print(res.countries.length);

        // print(res);
       country.addAll(res.countries);
        // final List<dynamic> jsonList=json['data'];
        // print(jsonList);
        // final List<CountryModel> countryList = [];
        // for (final json in jsonList) {
        //   countryList.add(CountryModel.fromJson(json));
        // }
        saveDataTOLocal(json, 'countries');
        // return countryList;
      } else {
        throw Exception('Failed to fetch data from API');
      }
    }

  }

  bool isDataExist(String key) {
    final box = GetStorage();
    return box.hasData(key);
  }
  void saveDataTOLocal(dynamic data,String key) {
    final box = GetStorage();
      box.write(key,data);
  }

  dynamic getData(String key) {
    final box = GetStorage();
   return box.read(key);
    }


  Future<void> uploadImage(String filePath) async {
    final uri = Uri.parse('https://example.com/upload-image');
    final request = http.MultipartRequest('POST', uri);
    final file = await http.MultipartFile.fromPath('image', filePath);
    request.files.add(file);
    final response = await request.send();
    if (response.statusCode == 200) {
      print('Image uploaded successfully!');
    } else {
      print('Failed to upload image. Status code: ${response.statusCode}');
    }
  }

 }