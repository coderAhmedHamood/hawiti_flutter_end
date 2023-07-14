import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/functions/functions.dart';
import '../data/api/http_client.dart';
import '../model/country_model.dart';
import 'BaseController.dart';
import 'common_operatin_controller.dart';
class BirthController extends GetxController with BaseController {
  var idController = TextEditingController();
  var branchProvinceIdCon = TextEditingController();
  var branchDirectoryIdCon = TextEditingController();
  var nameCon = TextEditingController();
  var genderCon = TextEditingController();
  var dobCon = TextEditingController();
  var dobHijriCon = TextEditingController();
  var villageBirthCon = TextEditingController();
  var provinceBirthIdCon = TextEditingController();
  var directoryBirthIdCon = TextEditingController();
  var fatherIdCon = TextEditingController();
  var motherIdCon = TextEditingController();
  var birthByCon = TextEditingController();
  var birthPlaceCon = TextEditingController();
  var familyCardNoCon = TextEditingController();
  var requestByCon = TextEditingController();

  var recordNumberController = TextEditingController();
  var requestDateController = TextEditingController();
  var phoneController = TextEditingController();
  var imageController = TextEditingController();
  var relationshipCon = TextEditingController();
  //lost
  var docNoCon = TextEditingController();
  var personIdReqCon = TextEditingController();
  int country = 0;
  int province = 0;
  int directory = 0;
  int branch = 0;
  String prevBranchId = '';


  CommonController commonController = Get.find();

  onInit() {
    genderCon.text = 'ذكر';
    super.onInit();
  }
  Future<void> addNewBirthCard() async {
    showLoading();
    final api = Api(); // create an instance of the Api class
    int gender=0;
    if(genderCon.text=='ذكر'){
      gender=1;
    }else{
      gender=0;
    }
    final response = await api.post('Request-Birth-Certificate'
      , {
        'branch_id':branch.toString(),
        'mother_national_identity': motherIdCon.text,
        'father_national_identity': fatherIdCon.text,
        'name': nameCon.text,
        'gender': gender.toString(),
        'date_birth': dobCon.text,
        'country': country.toString(),
        'province_birth_id': province.toString(),
        'directorate_birth_id': directory.toString(),
        'village_birth': villageBirthCon.text,
        'birth_by': birthByCon.text,
        'birth_place': birthPlaceCon.text,
        'phone': phoneController.text,
        // 'applicant': 'applicant'
      },
    );

    if (response.statusCode == 200) {
      closLoading();
      print('Data sent successfully');
    } else {
      closLoading();

      print('Error sending data: ${response.statusCode}');
      print('Error sending data: ${response.body}');
    }
  }
  Future<void> addLostBirthCard() async {
    showLoading();
    final api = Api(); // create an instance of the Api class

    final response = await api.post('request-lost'
      , {

        'national_identity':personIdReqCon.text ,
        'prev_branch_id': prevBranchId,
        'doc_number': docNoCon.text,
        'doc_type': '3',
        'branch_id': branch.toString(),
      },
    );
    if (response.statusCode == 200) {
      closLoading();
      var success = jsonDecode(response.body)['data'];
      var id = success['id'];
      showSuccessWithCloseButton('تم تقديم طلبك بنجاح',false);

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

  @override
  void dispose() {
    // idController.dispose();
    // requestStatusIdController.dispose();
    // personIdController.dispose();
    // familyCardPrevIdController.dispose();
    // er.dispose();
    //  imageController.dispose();
    //  relationshipCon.dispose(); recordNumberController.dispose();
    //  requestDateController.dispose();
    //  phoneControll
    //  super.dispose();
  }


}