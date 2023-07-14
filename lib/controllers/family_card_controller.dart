import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawiti/controllers/BaseController.dart';
import 'package:http/http.dart'as http;

import '../core/functions/functions.dart';
import '../data/api/http_client.dart';

class FamilyCardController extends GetxController with BaseController {
  var idController = TextEditingController();
  var requestStatusIdController = TextEditingController();
  var personIdController = TextEditingController();
  var familyCardPrevIdController = TextEditingController();
  var recordNumberController = TextEditingController();
  var requestDateController = TextEditingController();
  var phoneController = TextEditingController();
  var villageCurrentController = TextEditingController();
  var streetCurrentController = TextEditingController();
  var homeCurrentController = TextEditingController();
  var imageController = TextEditingController();
  var resultRequestController = TextEditingController();

int provinceId=0;
int branchId=0;
int directorateId=0;
int provinceCurrentId=0;
int directorateCurrentId=0;
String prevBranchId='';

  void requestFamilyCardLost() async {
    final api=Api();
    final response = await api.post('request-lost',
    {
      'national_identity': personIdController.text,
      'prev_branch_id': prevBranchId,
      'doc_number': familyCardPrevIdController.text,
      'doc_type': '2',
      'branch_id': branchId.toString(),


      // 'province_id': provinceId.toString(),
      // 'directorate_id': directorateId.toString(),
      // 'person_id_request':personIdController.text,
      // 'province_current_id': provinceCurrentId.toString(),
      // 'directorate_current_id': directorateCurrentId.toString(),
      // 'village_current': villageCurrentController.text,
      // 'street_current': streetCurrentController.text,
      // 'home_current': homeCurrentController.text,
      // 'image': 'plk'
    });
  // create model and controller for family card
  // create view for family card
  // create api for family card
  // create api for family card lost
  // create api for family card new
  // create api for family card update
  // create api for family card delete
  // create api for family card request
  // create api for family card request lost
    print(response.body);
    if (response.statusCode == 200) {
      closLoading();
      var success = jsonDecode(response.body)['data'];
      var id = success['id'];
      showSuccessSnack('تم ارسال الطلب بنجاح');

      //todo get the id of request and show in page response
      print(response.body);
      print('Request sent successfully');
      // print(response.body);

      // Data successfully sent to API
    } else {
      closLoading();
      print('Request error');
      print(response.body);
      showError(response.toString());
      //todo show error message
      // Handle error response
    }
  }





  Future<void> requestFamilyCard() async {
    showLoading();
    final api=Api();
    final response = await api.post('request-family-cards',
       {
       // 'province_id': provinceId.toString(),
       // 'directorate_id': directorateId.toString(),
       // 'person_id_request':personIdController.text,
       // 'province_current_id': provinceCurrentId.toString(),
       // 'directorate_current_id': directorateCurrentId.toString(),
       // 'village_current': villageCurrentController.text,
       // 'street_current': streetCurrentController.text,
       // 'home_current': homeCurrentController.text,
       // 'image': 'plk',
       //  'result_request': 'Example Result',
       //  'image': 'https://example.com/images/example.jpg',
         'national_identity': personIdController.text,
         'branch_id': branchId.toString(),
         'street': streetCurrentController.text,
         'country': '1',
         'province_current_id': provinceId.toString(),
         'directorate_current_id': directorateId.toString(),
         'village_current': villageCurrentController.text,

      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      print('Data sent successfully');
      closLoading();
      showSuccessWithCloseButton('تم تقديم الطلب بنجاح',true);
      // showSuccess('تم تقديم الطلب بنجاح');
    } else {
      print('Error sending data: ${response.statusCode}');
      print('Error sending data: ${response.body}');
    }
    closLoading();
  }
  @override
  void dispose() {
    idController.dispose();
    requestStatusIdController.dispose();
    personIdController.dispose();
    familyCardPrevIdController.dispose();
    recordNumberController.dispose();
    requestDateController.dispose();
    phoneController.dispose();
    imageController.dispose();
    resultRequestController.dispose();
    super.dispose();
  }
}
