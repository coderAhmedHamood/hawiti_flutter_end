import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../data/api/http_client.dart';
import '../core/functions/functions.dart';
import '../model/all_requests.dart';
import '../model/country_model.dart';
import '../model/id_card_request_result.dart';
import '../models/country.dart';
import '../view/screens/identification_card_request/all_request_screen.dart';
import '../view/screens/identification_card_request/barcode_screen.dart';
import 'BaseController.dart';
import 'common_operatin_controller.dart';
// import 'package:http/http.dart'as http;

class IdCardController extends GetxController with BaseController {
  // final client = HttpClient();

  final picker = ImagePicker();
  File? imageFile;
  File? imageFile2;
  File? imageFile3;
  File? imageFile4;
  File? imageFile5;
  File? imageFile6;
bool isLoad=true;
  Future<void> showPickImageDialog(BuildContext context,{int file=0}) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [

              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('الكاميرا'),
                onTap: () {
                  pickImage(ImageSource.camera,file:file);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> pickImage(ImageSource source,{int file=0}) async {
    final pickedFile  = await picker.pickImage(source: source);
    // setState(() {
    update();
    if (pickedFile != null) {
      if(file==0){
        imageFile = File(pickedFile.path);
      }else if(file==1){
        imageFile2 = File(pickedFile.path);
      }
      else if(file==2){
        imageFile3 = File(pickedFile.path);
      }
      else if(file==3){
        imageFile4 = File(pickedFile.path);
      }
      else if(file==4){
        imageFile5 = File(pickedFile.path);
      }
      else if(file==5){
        imageFile6 = File(pickedFile.path);
      }
      update();
    } else {
      print('No image selected.');
    }
    // });
  }

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
  TextEditingController genderController = TextEditingController();
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
  TextEditingController phoneController = TextEditingController();
  TextEditingController imagePathController = TextEditingController();
  TextEditingController employerController = TextEditingController();
  TextEditingController requestDateController = TextEditingController();
  TextEditingController resultRequestController = TextEditingController();

  TextEditingController personIdLostCon = TextEditingController();
  TextEditingController provinceIdLostCon = TextEditingController();
  TextEditingController directoryIdLostCon = TextEditingController();
  TextEditingController phoneLostCon = TextEditingController();

  //verfication
  TextEditingController requestIdCon = TextEditingController();
  TextEditingController personIdCon = TextEditingController();

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
  String prevBranchId='';
  bool enableIdMother = false;
  bool enableIdFather = false;
  String fatherHaveId = 'يمتلك';
  String fatherNationality = 'يمني';
  String nationality = 'يمني';
  String motherNationality = 'يمني';
      String gender = 'ذكر';
      String bloodType = 'A+';
      String maritalStatus = 'اعزب';
      String educationStatus = 'أمي';
      String educationLevel = 'بكالوريوس';
      String religion = 'مسلم';
  String motherHaveId = 'يمتلك';
  Branches branchDefault= Branches(id: 1, name: 'لايوجد فرع', provinceId: 1, directorateId: 1, managerName: 'managerName', userId: 1, createdAt: "createdAt", updatedAt: 'updatedAt');

  @override
  onInit() {
    super.onInit();
    commonController.getAllCountriesData();
    countries.clear();
    countries.addAll(commonController.country);
    print("onInit");

    selectedCountryBranch = countries[0];
    selectedCountryPrevBranch = countries[0];
    selectedCityBranch = selectedCountryBranch.provinces[0];
    selectedCityPrevBranch = selectedCountryPrevBranch.provinces[0];
    selectedDirectoryBranch = selectedCityBranch.directories[0];
    selectedDirectoryPrevBranch = selectedCityPrevBranch.directories[0];
    if(selectedDirectoryBranch.branches.isNotEmpty) {
      selectedBranch = selectedDirectoryBranch.branches[0];
    }else{
      selectedBranch=branchDefault;
    }
    if(selectedDirectoryPrevBranch.branches.isNotEmpty) {
      selectedPrevBranch = selectedDirectoryPrevBranch.branches[0];
    }else{
      selectedPrevBranch=branchDefault;
    }

    selectedCountryBirth = countries[0];
    selectedCityBirth = selectedCountryBirth.provinces[0];
    selectedDirectoryBirth = selectedCityBirth.directories[0];
    countryBirthIdController.text = selectedCountryBirth.id.toString();
    provinceBirthIdController.text = selectedCityBirth.id.toString();
    directorateBirthIdController.text = selectedDirectoryBirth.id.toString();

    selectedCountryCurrent = countries[0];
    selectedCityCurrent = selectedCountryCurrent.provinces[0];
    selectedDirectoryCurrent = selectedCityCurrent.directories[0];
    provinceResidenceIdController.text = selectedCityCurrent.id.toString();
    countryResidenceIdController.text = selectedCountryCurrent.id.toString();
    directorateResidenceIdController.text =
        selectedDirectoryCurrent.id.toString();
    isLoad=false;
    update();
  }

  List<String> arabicNationalities = [
    "يمني",


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
    if(selectedCityBranch.directories.isNotEmpty){
      selectedDirectoryBranch= selectedCityBranch.directories[0];
      if(selectedDirectoryBranch.branches.isNotEmpty) {
        selectedBranch = selectedDirectoryBranch.branches[0];
      }
    }else{
      selectedBranch=branchDefault;
    }

    // provinceResidenceIdController.text = selectedDirectoryCurrent.id.toString();
    update();
  }
  void onCityBranchPrevChanged(Provinces? city) {
    selectedCityPrevBranch = city!;
    if(selectedCityPrevBranch.directories.isNotEmpty){
      selectedDirectoryPrevBranch= selectedCityPrevBranch.directories[0];
      if(selectedDirectoryPrevBranch.branches.isNotEmpty) {
        selectedPrevBranch = selectedDirectoryPrevBranch.branches[0];
      }
    }else{
      selectedPrevBranch=branchDefault;
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
    if(selectedDirectoryBranch.branches.isNotEmpty){
    selectedBranch=selectedDirectoryBranch.branches.first;
    }
    // directorateResidenceIdController.text = selectedCityCurrent.id.toString();
    update();
  }
  void onDirectoryBranchPrevChanged(Directories? directory) {
    selectedDirectoryPrevBranch = directory!;
    if(selectedDirectoryPrevBranch.branches.isNotEmpty){
      selectedPrevBranch=selectedDirectoryPrevBranch.branches.first;
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
    provinceIdLostCon.text = selectedCityBirth.id.toString();
    update();
  }

  void onDirectoryBirthChanged(Directories? directory) {
    selectedDirectoryBirth = directory!;
    directorateBirthIdController.text = selectedDirectoryBirth.id.toString();
    directoryIdLostCon.text = selectedDirectoryBirth.id.toString();
    update();
  }

  ///birth date
  var selectedBirthDate = TimeOfDay.now();

  void updateBirthDate(TimeOfDay newTime) {
    selectedBirthDate = newTime;
    update();
  }

  void checkMotherId() {}

  void checkFatherId() {}

  void getMyRequests() {}

  void checkMyRequestState() {}

  init() {}

//todo specific add mather and Father by id only or all data
  Future<void> requestIdCard() async {
    try {
      showLoading();
      final api = Api(); // create an instance of the Api class
      print('start request');
      final response = await api.post('request-id-cards/add', {
        'first_name': nameController.text,
        'second_name': fatherNameController.text,
        'third_name': grandFatherNameController.text,
        'fourth_name': fatherThirdNameController.text,
        'nick_name': nickNameController.text,
        'nationality': nationalityIdController.text,
        'mother_nationality': motherNationalityIdController.text,
        'father_nationality': fatherNationalityIdController.text,
        'mother_full_name': motherNameController.text+" "+grandMotherNameController.text+" "+motherThirdNameController.text+" "+motherNickNameController.text,
        'gender': '0',
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
        // 'name': nameController.text,
        // 'father_name': fatherNameController.text,
        // 'mother_name': motherNameController.text,
        // 'grand_father_name': "grandFatherNameController.text",
        // 'grand_mother_name': "grandMotherNameController.text",
        // 'nick_name': nickNameController.text,
        // 'father_nick_name': "fatherNickNameController.text",
        // 'mother_nick_name': "motherNickNameController.text",
        // 'father_third_name': "fatherThirdNameController.text",
        // 'mother_third_name': "motherThirdNameController.text",
        // 'nationality_id': nationalityIdController.text,
        // 'father_nationality_id': '1', // fatherNationalityIdController.text,
        // 'mother_nationality_id': '1', //motherNationalityIdController.text,
        // 'gender': '1', // genderController.text,
        // 'nationality_id': '1',
        // 'date_of_birth': dateOfBirthController.text,
        // 'date_of_birth_hijri': dateOfBirthHijriController.text,
        // 'country_birth_id': countryBirthIdController.text,
        // 'province_birth_id': provinceBirthIdController.text,
        // 'directorate_birth_id': directorateBirthIdController.text,
        // 'village_birth': villageBirthController.text,
        // 'marital_status': maritalStatusController.text,
        // 'blood_type_id': bloodTypeIdController.text,
        // 'education_status_id': '1',
        // // educationStatusController.text,
        // 'education_level': educationLevelController.text,
        // 'country_residence_id': countryResidenceIdController.text,
        // 'province_residence_id': provinceResidenceIdController.text,
        // 'directorate_residence_id': directorateResidenceIdController.text,
        // 'village_residence': villageResidenceController.text,
        // 'street': streetController.text,
        // 'home': homeController.text,
        // 'Religion': religionController.text,
        // 'specilaization': specializationController.text,
        // 'occupation': occupationController.text,
        // 'phone': phoneController.text,
        // 'image_path': imagePathController.text,
        // 'Employer': employerController.text,
        // 'request_date': requestDateController.text,
        // 'result_request': resultRequestController.text,
      });
print(response.body);
      // const url = 'https://topsoftp.com/hawiti/api/request-id-cards/add';
      // const url = 'https://topsoftp.com/hawiti/api/request-id-cards/add';
      // final response = await http.post(Uri.parse(url), body: {
      //   'name': nameController.text,
      //   'father_name': fatherNameController.text,
      //   'mother_name': motherNameController.text,
      //   'grand_father_name': "grandFatherNameController.text",
      //   'grand_mother_name': "grandMotherNameController.text",
      //   'nick_name': nickNameController.text,
      //   'father_nick_name': "fatherNickNameController.text",
      //   'mother_nick_name': "motherNickNameController.text",
      //   'father_third_name': "fatherThirdNameController.text",
      //   'mother_third_name': "motherThirdNameController.text",
      //   'nationality_id': nationalityIdController.text,
      //   'father_nationality_id': '1', // fatherNationalityIdController.text,
      //   'mother_nationality_id': '1', //motherNationalityIdController.text,
      //   'gender': '1', // genderController.text,
      //   'nationality_id': '1',
      //   'date_of_birth': dateOfBirthController.text,
      //   'date_of_birth_hijri': dateOfBirthHijriController.text,
      //   'country_birth_id': countryBirthIdController.text,
      //   'province_birth_id': provinceBirthIdController.text,
      //   'directorate_birth_id': directorateBirthIdController.text,
      //   'village_birth': villageBirthController.text,
      //   'marital_status': maritalStatusController.text,
      //   'blood_type_id': bloodTypeIdController.text,
      //   'education_status_id': '1',
      //   // educationStatusController.text,
      //   'education_level': educationLevelController.text,
      //   'country_residence_id': countryResidenceIdController.text,
      //   'province_residence_id': provinceResidenceIdController.text,
      //   'directorate_residence_id': directorateResidenceIdController.text,
      //   'village_residence': villageResidenceController.text,
      //   'street': streetController.text,
      //   'home': homeController.text,
      //   'Religion': religionController.text,
      //   'specilaization': specializationController.text,
      //   'occupation': occupationController.text,
      //   'phone': phoneController.text,
      //   'image_path': imagePathController.text,
      //   'Employer': employerController.text,
      //   // 'request_date': requestDateController.text,
      //   // 'result_request': resultRequestController.text,
      // });

      if (response.statusCode == 200) {
        // print(response.body);
        // closLoading();
        var data = jsonDecode(response.body);
        IdCardRequestResult requestResult=IdCardRequestResult.fromJson(data);
        closLoading();
        showSuccessWithCloseButton('تم تقديم طلبك بنجاح',false);
        // BarcodeScreen();
        Future.delayed(const Duration(seconds: 3),(){
          Get.off(()=>BarcodeScreen(model: requestResult));
        });


        // var token = sucsses['token'];
        print('Data added successfully');
        //todo get the id of request and show in page response
      } else {
        // print(response.body);
        closLoading();
        print('Failed to add data. Error code: ${response.statusCode}');
      }
    } catch (e) {
      print('cath error$e');
      closLoading();
    }
  }

  Future<void> addRequestLostId() async {
    try {
      showLoading();
      final api = Api(); // create an instance of the Api class
      print('start request lost');

      final response = await api.post('Request-Identification-CardLost', {
        // 'person_id': personIdLostCon.text,
        // 'province_id': provinceIdLostCon.text,
        // 'directorate_id': directoryIdLostCon.text,
        // 'phone': phoneLostCon.text,
        // 'image_path': "imagePath",


        'national_identity': personIdLostCon.text,
        'prev_branch_id': selectedPrevBranch.id.toString(),
        'doc_number': personIdLostCon.text,
        'doc_type': '1',
        'branch_id': selectedBranch.id.toString()
        // 'request_date': requestDate.toIso8601String(),
      });
      // final response = await http.post(Uri.parse('http://192.168.0.147:8000/api/Request-Identification-CardLost'),
      //   body: {
      //     'person_id': personIdLostCon.text,
      //     'province_id':provinceIdLostCon.text,
      //     'directorate_id': directoryIdLostCon.text,
      //     'phone': phoneLostCon.text,
      //     'image_path': "imagePath",
      //     // 'request_date': requestDate.toIso8601String(),
      //   },
      // );

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
    } catch (e) {
      print(e.toString());
      closLoading();
    }
  }
  Future<void> getAllRequests() async {
    try {
      showLoading();
      final api = Api(); // create an instance of the Api class
      print('start request lost');

      final response = await api.get('all-request');
      if (response.statusCode == 200) {
        closLoading();
        var data = jsonDecode(response.body);
        print(response.body);
        AllRequestData allRequestData =AllRequestData.fromJson(data);
   Get.to(()=>AllRequestScreen(allRequestData: allRequestData,));
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
    } catch (e) {
      print(e.toString());
      closLoading();
    }
  }

  // Handle exception

  void addChangDataRequest() async {
    // final response = await http.post(Uri.parse('$apiUrl/identification-card-change-data'), body: {
    // 'person_id': personId.toString(),
    // 'request_status_id': requestStatusId.toString(),
    // 'province_id': provinceId.toString(),
    // 'directorate_id': directorateId.toString(),
    // 'phone': phone,
    // 'image_path': imagePath,
    // 'request_date': requestDate
    // });

    // if (response.statusCode == 200) {
    //   print('Request sent successfully');
    // } else {
    //   print('Error sending request');
    // }
  }

  Future<void> uploadIdCardImages({
      required String type1, required String type2, required String type3,required String type4,required String type5,required String idRequest}) async {
    showLoading();
    late String _token = '';
    _token = GetStorage().read('token')??"";
    const String _baseUrl = 'http://192.168.0.147/hawiti_end/api/idCard/savesImages';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $_token',
      "Accept": 'application/json',
    };
    var request = http.MultipartRequest('POST', Uri.parse(_baseUrl))
      ..fields.addAll({
        "id": idRequest,
        "file_type1": type1,
        "file_type2": type2,
        "file_type3": type3,
        "file_type4": type4,
        "file_type5": type5,
      })
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('image_1', imageFile!.path))
      ..files.add(await http.MultipartFile.fromPath('image_2', imageFile2!.path))
      ..files.add(await http.MultipartFile.fromPath('image_3', imageFile3!.path))
      ..files.add(await http.MultipartFile.fromPath('image_4', imageFile4!.path))
      ..files.add(await http.MultipartFile.fromPath('image_5', imageFile5!.path));
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

