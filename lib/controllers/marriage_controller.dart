
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

class MarriageController extends GetxController {
  // Add TextEditingController variable for each column of the table

  final TextEditingController idController = TextEditingController();
  final TextEditingController requestStatusIdController = TextEditingController();
  final TextEditingController provinceIdController = TextEditingController();
  final TextEditingController directorateIdController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController verificationByController = TextEditingController();
  final TextEditingController docNumberController = TextEditingController();
  final TextEditingController docDateController = TextEditingController();
  final TextEditingController personIdManController = TextEditingController();
  final TextEditingController personIdWomenController = TextEditingController();
  final TextEditingController ageFirstMarriageManController = TextEditingController();
  final TextEditingController ageFirstMarriageWomenController = TextEditingController();
  final TextEditingController prevMaritalStatusManController = TextEditingController();
  final TextEditingController prevMaritalStatusWomenController = TextEditingController();
  final TextEditingController countPrevMarriageManController = TextEditingController();
  final TextEditingController countPrevMarriageWomenController = TextEditingController();
  final TextEditingController countPrevChildMenTotalController = TextEditingController();
  final TextEditingController countPrevChildMenMaleController = TextEditingController();
  final TextEditingController countPrevChildMenFemaleController = TextEditingController();
  final TextEditingController countPrevChildWomenTotalController = TextEditingController();
  final TextEditingController countPrevChildWomenMaleController = TextEditingController();
  final TextEditingController countPrevChildWomenFemaleController = TextEditingController();
  final TextEditingController dateMarriageHijriController = TextEditingController();
  final TextEditingController dateMarriageController = TextEditingController();
  final TextEditingController requestDateController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController resultRequestController = TextEditingController();

  Future<void> addRequestMarriage() async {
    final url = 'https://your-api-url.com/submit-marriage-register';
    final response = await http.post(Uri.parse(url), body: {
      'request_status_id': requestStatusIdController.text,
      'province_id': provinceIdController.text,
      'directorate_id': directorateIdController.text,
      'type': typeController.text,
      'verification_by': verificationByController.text,
      'doc_number': docNumberController.text,
      'doc_date': docDateController.text,
      'person_id_man': personIdManController.text,
      'person_id_women': personIdWomenController.text,
      'age_first_marriage_man': ageFirstMarriageManController.text,
      'age_first_marriage_women': ageFirstMarriageWomenController.text,
      'prev_marital_status_man': prevMaritalStatusManController.text,
      'prev_marital_status_women': prevMaritalStatusWomenController.text,
      'count_prev_marriage_man': countPrevMarriageManController.text,
      'count_prev_marriage_women': countPrevMarriageWomenController.text,
      'count_prev_child_men_total': countPrevChildMenTotalController.text,
      'count_prev_child_men_male': countPrevChildMenMaleController.text,
      'count_prev_child_men_female': countPrevChildMenFemaleController.text,
      'count_prev_child_women_total': countPrevChildWomenTotalController.text,
      'count_prev_child_women_male': countPrevChildWomenMaleController.text,
      'count_prev_child_women_female': countPrevChildWomenFemaleController.text,
      'date_marriage_hijri': dateMarriageHijriController.text,
      'date_marriage': dateMarriageController.text,
      'request_date': requestDateController.text,
      'phone': phoneController.text,
      'result_request': resultRequestController.text,
    });

    // Check the response status code and handle accordingly
    if (response.statusCode == 200) {

    }
    }
      @override
  void dispose() {
    // Dispose all TextEditingController when the controller is disposed
    idController.dispose();
    requestStatusIdController.dispose();
    provinceIdController.dispose();
    directorateIdController.dispose();
    typeController.dispose();
    verificationByController.dispose();
    docNumberController.dispose();
    docDateController.dispose();
    personIdManController.dispose();
    personIdWomenController.dispose();
    ageFirstMarriageManController.dispose();
    ageFirstMarriageWomenController.dispose();
    prevMaritalStatusManController.dispose();
    prevMaritalStatusWomenController.dispose();
    countPrevMarriageManController.dispose();
    countPrevMarriageWomenController.dispose();
    countPrevChildMenTotalController.dispose();
    countPrevChildMenMaleController.dispose();
    countPrevChildMenFemaleController.dispose();
    countPrevChildWomenTotalController.dispose();
    countPrevChildWomenMaleController.dispose();
    countPrevChildWomenFemaleController.dispose();
    dateMarriageHijriController.dispose();
    dateMarriageController.dispose();
    requestDateController.dispose();
    phoneController.dispose();
    resultRequestController.dispose();
    super.dispose();
  }
}
