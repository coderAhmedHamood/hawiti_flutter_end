
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/api/http_client.dart';
import 'BaseController.dart';

class DeathController extends GetxController  with BaseController{
  final TextEditingController idController = TextEditingController();
  final TextEditingController requestPersonIdController = TextEditingController();
  final TextEditingController personDeathIdController = TextEditingController();
  final TextEditingController requestDateController = TextEditingController();
  final TextEditingController relationAuthorController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController requestStatusIdController = TextEditingController();
  final TextEditingController provinceIdController = TextEditingController();
  final TextEditingController directorateIdController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController deathDateController = TextEditingController();
  final TextEditingController deathDateHijriController = TextEditingController();
  final TextEditingController provinceDeathIdController = TextEditingController();
  final TextEditingController directorateDeathIdController = TextEditingController();
  final TextEditingController villageDeathController = TextEditingController();
  final TextEditingController reasonDeathController = TextEditingController();
  final TextEditingController placeDeathController = TextEditingController();
  final TextEditingController requestByController = TextEditingController();
  final TextEditingController resultRequestController = TextEditingController();
final api =Api();
  Future<void> requestDeathCertificate() async {
    final data = {
      // 'id': idController.text,
      'request_person_id': requestPersonIdController.text,
      'person_death_id': personDeathIdController.text,
      // 'request_date': requestDateController.text,
      'relation_author': relationAuthorController.text,
      'phone': phoneController.text,
      'request_status_id': requestStatusIdController.text,
      'province_id': provinceIdController.text,
      'directorate_id': directorateIdController.text,
      'age': ageController.text,
      'death_date': deathDateController.text,
      'death_date_hijri': deathDateHijriController.text,
      'province_death_id': provinceDeathIdController.text,
      'directorate_death_id': directorateDeathIdController.text,
      'village_death': villageDeathController.text,
      'reason_death': reasonDeathController.text,
      'place_death': placeDeathController.text,
      'request_by': requestByController.text,
      'result_request': resultRequestController.text,
    };

   final response= await api.post('Request-Death-Certificate', data);

   if(response.statusCode==200){
     print('sucssess');
     print(response.body);
  }
  else{
    print('error');
    print(response);
  }
  }


  @override
  void dispose() {
    idController.dispose();
    requestPersonIdController.dispose();
    personDeathIdController.dispose();
    requestDateController.dispose();
    relationAuthorController.dispose();
    phoneController.dispose();
    requestStatusIdController.dispose();
    provinceIdController.dispose();
    directorateIdController.dispose();
    ageController.dispose();
    deathDateController.dispose();
    deathDateHijriController.dispose();
    provinceDeathIdController.dispose();
    directorateDeathIdController.dispose();
    villageDeathController.dispose();
    reasonDeathController.dispose();
    placeDeathController.dispose();
    requestByController.dispose();
    resultRequestController.dispose();
    super.dispose();
  }

}