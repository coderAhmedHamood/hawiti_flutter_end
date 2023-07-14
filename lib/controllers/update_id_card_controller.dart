import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'dart:convert';

// import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../data/api/http_client.dart';
import '../core/functions/functions.dart';
import '../model/all_requests.dart';
import '../model/country_model.dart';
import '../model/id_card_request_result.dart';
import '../model/update_id_card.dart';
import '../models/country.dart';
import '../view/screens/identification_card_request/all_request_screen.dart';
import '../view/screens/identification_card_request/barcode_screen.dart';
import 'BaseController.dart';
import 'common_operatin_controller.dart';
// import 'package:http/http.dart'as http;

class UpdateIdCardController extends GetxController with BaseController {
  // final client = HttpClient();

   bool isLoad = true;

  TextEditingController idController = TextEditingController();
  TextEditingController fatherIdController = TextEditingController();
  TextEditingController motherIdController = TextEditingController();
  TextEditingController requestStatusIdController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  TextEditingController thirdNameController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController motherNameController = TextEditingController();
  TextEditingController grandFatherNameController = TextEditingController();
  TextEditingController grandMotherNameController = TextEditingController();


// TextEditingController nickNameController = TextEditingController();
  TextEditingController fatherNickNameController = TextEditingController();
  TextEditingController motherNickNameController = TextEditingController();
  TextEditingController fatherThirdNameController = TextEditingController();
  TextEditingController motherThirdNameController = TextEditingController();
  TextEditingController nationalityIdController = TextEditingController();
  TextEditingController fatherNationalityIdController = TextEditingController();
  TextEditingController motherNationalityIdController = TextEditingController();
  TextEditingController genderController = TextEditingController(text: 'Male');
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController dateOfBirthHijriController = TextEditingController();
  TextEditingController countryBirthIdController = TextEditingController();
  TextEditingController provinceBirthIdController = TextEditingController();
  TextEditingController directorateBirthIdController = TextEditingController();
  TextEditingController villageBirthController = TextEditingController();
  TextEditingController maritalStatusController = TextEditingController();
  TextEditingController bloodTypeIdController = TextEditingController();
  TextEditingController educationStatusController = TextEditingController();
  TextEditingController educationLevelController = TextEditingController();
  TextEditingController countryResidenceIdController = TextEditingController();
  TextEditingController provinceResidenceIdController = TextEditingController();
  TextEditingController directorateResidenceIdController =
      TextEditingController();
  TextEditingController villageResidenceController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController homeController = TextEditingController();
  TextEditingController religionController = TextEditingController();
  TextEditingController specializationController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController employerController = TextEditingController();
  TextEditingController requestDateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController imagePathController = TextEditingController();

  // late List<CountryModel> countries;
  late List<Country> countries = [];
  late Country selectedCountryCurrent;
  late Country selectedCountryBirth;
  late Country selectedCountryBranch;
  late Country selectedCountryPrevBranch;
  late Provinces selectedCityCurrent;
  late Provinces selectedCityBranch;
  late Provinces selectedCityPrevBranch;
  late Branches selectedBranch;
  late Branches selectedPrevBranch;
  late Provinces selectedCityBirth;
  late Directories selectedDirectoryCurrent;
  late Directories selectedDirectoryBranch;
  late Directories selectedDirectoryPrevBranch;
  late Directories selectedDirectoryBirth;
  CommonController commonController = Get.find();




  //
  late String prevBranchId ;
  late bool enableIdMother ;
  late  bool enableIdFather ;
  late String fatherHaveId ;
  late String fatherNationality;
  late String nationality ;
  late String motherNationality ;
  late String gender ;
  late String bloodType ;
  late String maritalStatus ;
  late String educationStatus;
  late String educationLevel ;
  late String religion ;
  late String motherHaveId;




  Branches branchDefault = Branches(
      id: 1,
      name: 'لايوجد فرع',
      provinceId: 1,
      directorateId: 1,
      managerName: 'managerName',
      userId: 1,
      createdAt: "createdAt",
      updatedAt: 'updatedAt');

  @override
  onInit() {
    super.onInit();
    commonController.getAllCountriesData();
    countries.clear();
    countries.addAll(commonController.country);

    print("onInit....");

    // تقديم الى
    selectedCountryBranch = countries[0];
    selectedCountryPrevBranch = countries[0];
    selectedCityBranch = selectedCountryBranch.provinces[personData.selectedCityBranch];
     selectedDirectoryBranch = selectedCityBranch.directories[personData.selectedDirectoryBranch];
    selectedCityPrevBranch = selectedCountryPrevBranch.provinces[0];
    selectedDirectoryPrevBranch = selectedCityPrevBranch.directories[0];


    if (selectedDirectoryBranch.branches.isNotEmpty) {
      selectedBranch = selectedDirectoryBranch.branches[0];
    } else {
      selectedBranch = branchDefault;
    }
    if (selectedDirectoryPrevBranch.branches.isNotEmpty) {
      selectedPrevBranch = selectedDirectoryPrevBranch.branches[0];
    } else {
      selectedPrevBranch = branchDefault;
    }

    // عنوان الميلاد
    selectedCountryBirth = countries[0];
    selectedCityBirth = selectedCountryBirth.provinces[personData.selectedCityBirth];
    selectedDirectoryBirth = selectedCityBirth.directories[personData.selectedDirectoryBirth];
    countryBirthIdController.text = selectedCountryBirth.id.toString();
    provinceBirthIdController.text = selectedCityBirth.id.toString();
    directorateBirthIdController.text = selectedDirectoryBirth.id.toString();

    // عنوان الاقامة

    selectedCountryCurrent = countries[0];
    selectedCityCurrent = selectedCountryCurrent.provinces[personData.selectedCityCurrent];
    selectedDirectoryCurrent = selectedCityCurrent.directories[personData.selectedDirectoryCurrent];
    provinceResidenceIdController.text = selectedCityCurrent.id.toString();
    countryResidenceIdController.text = selectedCountryCurrent.id.toString();

    directorateResidenceIdController.text =
        selectedDirectoryCurrent.id.toString();
    isLoad = false;
    update();

       fatherHaveId = personData.fatherHaveId;
     fatherNationality = personData.fatherNationality;
     nationality = personData.nationality;
     motherNationality = personData.motherNationality;
     gender = personData.gender;
     bloodType = personData.bloodType;
     maritalStatus = personData.maritalStatus;
     religion = personData.religion;
    motherHaveId = personData.motherHaveId;
     educationLevel = personData.educationLevel;
    educationStatus = personData.educationStatus;

    idController.text = personData.id;
    fatherIdController.text = personData.fatherId;
    motherIdController.text = personData.motherId;
    nameController.text = personData.name;
    secondNameController.text = personData.secondName;
    motherNameController.text = personData.motherName;
    nickNameController.text = personData.nickName;
    fatherNameController.text = personData.fatherName;
    grandFatherNameController.text = personData.grandFatherName;
    grandMotherNameController.text = personData.grandMotherName;
    fatherNickNameController.text = personData.fatherNickName;
    motherNickNameController.text = personData.motherNickName;
    fatherThirdNameController.text = personData.fatherThirdName;
    motherThirdNameController.text = personData.motherThirdName;
    nationalityIdController.text = personData.nationalityId;
    fatherNationalityIdController.text = personData.fatherNationalityId;
    motherNationalityIdController.text = personData.motherNationalityId;
    dateOfBirthController.text = personData.dateOfBirth;
    dateOfBirthHijriController.text = personData.dateOfBirthHijri;
    countryBirthIdController.text = personData.countryBirthId;
    provinceBirthIdController.text = personData.provinceBirthId;
    directorateBirthIdController.text = personData.directorateBirthId;
    villageBirthController.text = personData.villageBirth;
    maritalStatusController.text = personData.maritalStatusController;
    bloodTypeIdController.text = personData.bloodTypeId;
    educationStatusController.text = personData.educationStatus;
    educationLevelController.text = personData.educationLevel;
    countryResidenceIdController.text = personData.countryResidenceId;
    provinceResidenceIdController.text = personData.provinceResidenceId;
    directorateResidenceIdController.text = personData.directorateResidenceId;
    religionController.text = personData.religionController;
    streetController.text = personData.street;
    villageResidenceController.text = personData.villageResidence;
    homeController.text = personData.home;
    specializationController.text = personData.specialization;
    occupationController.text = personData.occupation;
    phoneController.text = personData.phone;
    imagePathController.text = personData.imagePath;
    employerController.text = personData.employer;
    requestDateController.text = personData.requestDate;


  }

  List<String> arabicNationalities = [
    "يمني",
    "سعودي",
    "مصري",
    "إماراتي",
    "قطري",
  ];

  List<String> bloodTypes = [
    "A+",
    "A-",
    "B+",
    "B-",
    "AB+",
    "AB-",
    "O+",
    "O-"
    // Add more blood types as needed
  ];

  ///current address
  void onCountryCurrentChanged(Country? country) {
    selectedCountryCurrent = country!;
    selectedCityCurrent = selectedCountryCurrent.provinces[0];
    selectedDirectoryCurrent = selectedCityCurrent.directories[0];
    countryResidenceIdController.text = selectedCountryCurrent.id.toString();
    update();
  }

  void onCityCurrentChanged(Provinces? city) {
    selectedCityCurrent = city!;
    selectedDirectoryCurrent = selectedCityCurrent.directories[0];
    provinceResidenceIdController.text = selectedDirectoryCurrent.id.toString();
    update();
  }

  void onDirectoryCurrentChanged(Directories? directory) {
    selectedDirectoryCurrent = directory!;
    directorateResidenceIdController.text = selectedCityCurrent.id.toString();
    update();
  }

  ///branch
  void onCityBranchChanged(Provinces? city) {
    selectedCityBranch = city!;
    if (selectedCityBranch.directories.isNotEmpty) {
      selectedDirectoryBranch = selectedCityBranch.directories[0];
      if (selectedDirectoryBranch.branches.isNotEmpty) {
        selectedBranch = selectedDirectoryBranch.branches[0];
      }
    } else {
      selectedBranch = branchDefault;
    }

    // provinceResidenceIdController.text = selectedDirectoryCurrent.id.toString();
    update();
  }

  void onCityBranchPrevChanged(Provinces? city) {
    selectedCityPrevBranch = city!;
    if (selectedCityPrevBranch.directories.isNotEmpty) {
      selectedDirectoryPrevBranch = selectedCityPrevBranch.directories[0];
      if (selectedDirectoryPrevBranch.branches.isNotEmpty) {
        selectedPrevBranch = selectedDirectoryPrevBranch.branches[0];
      }
    } else {
      selectedPrevBranch = branchDefault;
    }
    // provinceResidenceIdController.text = selectedDirectoryCurrent.id.toString();
    update();
  }

  void onBranchChanged(Branches? branch) {
    // selectedCityBranch = city!;
    // selectedDirectoryBranch= selectedCityBranch.directories[0];
    // provinceResidenceIdController.text = selectedDirectoryCurrent.id.toString();
    update();
  }

  void onBranchPrevChanged(Branches? branch) {
    // selectedCityBranch = city!;
    // selectedDirectoryBranch= selectedCityBranch.directories[0];
    // provinceResidenceIdController.text = selectedDirectoryCurrent.id.toString();
    update();
  }

  void onDirectoryBranchChanged(Directories? directory) {
    selectedDirectoryBranch = directory!;
    if (selectedDirectoryBranch.branches.isNotEmpty) {
      selectedBranch = selectedDirectoryBranch.branches.first;
    }
    // directorateResidenceIdController.text = selectedCityCurrent.id.toString();
    update();
  }

  void onDirectoryBranchPrevChanged(Directories? directory) {
    selectedDirectoryPrevBranch = directory!;
    if (selectedDirectoryPrevBranch.branches.isNotEmpty) {
      selectedPrevBranch = selectedDirectoryPrevBranch.branches.first;
    }
    // directorateResidenceIdController.text = selectedCityCurrent.id.toString();
    update();
  }

  ///birth address
  void onCountryBirthChanged(Country? country) {
    selectedCountryBirth = country!;
    selectedCityBirth = selectedCountryBirth.provinces[0];
    selectedDirectoryBirth = selectedCityBirth.directories[0];
    countryBirthIdController.text = selectedCountryBirth.id.toString();
    update();
  }

  void onCityBirthChanged(Provinces? city) {
    selectedCityBirth = city!;
    selectedDirectoryBirth = selectedCityBirth.directories[0];
    provinceBirthIdController.text = selectedCityBirth.id.toString();
     update();
  }

  void onDirectoryBirthChanged(Directories? directory) {
    selectedDirectoryBirth = directory!;
    directorateBirthIdController.text = selectedDirectoryBirth.id.toString();
     update();
  }

//todo specific add mather and Father by id only or all data

  Future<void> updateIdCardRequest({
    required String requestId,
    String? motherNationalityId,
    String? fatherNationalityId,
  }) async {
    try {

      showLoading();
      final api = Api();
      // final response = await api.put
      final response = await api.post('request-id-cards/update/$requestId', {


        'first_name': nameController.text,
        'second_name': fatherNameController.text,
        'third_name': grandFatherNameController.text,
        'fourth_name': fatherThirdNameController.text,
        'nick_name': nickNameController.text,
        'nationality': nationalityIdController.text,
        'mother_nationality': motherNationalityIdController.text,
        'father_nationality': fatherNationalityIdController.text,
        'mother_full_name': motherNameController.text +
            " " +
            grandMotherNameController.text +
            " " +
            motherThirdNameController.text +
            " " +
            motherNickNameController.text,
        'gender': gender,
        'date_of_birth': dateOfBirthController.text,
        'marital_status': maritalStatus,
        'blood_type': bloodTypeIdController.text,
        'education_status': educationStatusController.text,
        'education_level': educationLevelController.text,
        'religion': religionController.text,
        'specilaization': specializationController.text,
        'phone': phoneController.text,
        'image_path': 'imagepath',
        'employer': employerController.text,
        'country_birth_id': selectedCountryBirth.id.toString(),
        'province_birth_id': selectedCityBirth.id.toString(),
        'directorate_birth_id': selectedDirectoryBirth.id.toString(),
        'village_birth': villageBirthController.text,
        'country_residence_id': selectedCountryCurrent.id.toString(),
        'province_residence_id': selectedCityCurrent.id.toString(),
        'directorate_residence_id': selectedDirectoryCurrent.id.toString(),
        'village_residence': villageResidenceController.text,
        'branch_id': selectedBranch.id.toString(),


      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        IdCardRequestResult requestResult = IdCardRequestResult.fromJson(data);
        closLoading();
        showSuccessWithCloseButton('تم تحديث طلبك بنجاح', false);
        Future.delayed(Duration(seconds: 3), () {
          Get.off(() => BarcodeScreen(model: requestResult));
        });
      } else {

        closLoading();
        showError('لم يتم التحديث بنجاح: ${response.statusCode}');
        print('Failed to update data. Error code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      closLoading();
    }
  }


  // Handle exception


}

