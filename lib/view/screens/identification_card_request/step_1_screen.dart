// import 'package:clothes/controllers/cardController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawiti/resources/constant.dart';
import 'package:hawiti/view/screens/identification_card_request/step_2_screen.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controllers/id_card_controller.dart';
import '../../../controllers/id_card_controller.dart';
import '../../../controllers/id_card_controller.dart';
import '../../../model/country_model.dart';
import '../../../models/country.dart';
import '../../widgets/CustomTextField.dart';
import '../../widgets/cascade_dropdown.dart';
import '../../widgets/custom_drop_down.dart';

// import '../widgets/custom_text_field.dart';
// var cardController = Get.put(cardController());

class stepOneScreen extends StatelessWidget {
  stepOneScreen({Key? key}) : super(key: key);
  IdCardController cardController = Get.find();
  String value = '';
  String nationality = 'محافظة ';
  String blood = 'O+';
  TextEditingController dateInput = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Future<void> _launchInBrowser() async {
    final Uri url = Uri.parse('https://cra.gov.ye/index.php?sub=ID_new');

    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "تقديم طلب بطاقة شخصية جديدة ",
          style: TextStyle(fontFamily: 'NotoKufiArabic', fontSize: 15),
        ),
        centerTitle: true,
      ),
      // backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: GetBuilder<IdCardController>(builder: (logic) {
                return Column(
                  children: [
                    Row(
                      children: [

                        Expanded(
                          child: ElevatedButton(

                            onPressed: _launchInBrowser,
                            child: Text('ماهي الوثائق المطلوبة والإجراءات اللازمة ؟',style:TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ) ,
                              textAlign: TextAlign.center,
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              shadowColor:MaterialStateProperty.all<Color>(Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                        Container(

                        decoration: BoxDecoration(

                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                        children: [

                     Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          " البيانات الشخصية",
                          style: TextStyle(
                            fontFamily: 'NotoKufiArabic',
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: CustomTextField(
                              context: context,
                              initialValue: '  الاسم ',
                              icon: Icons.person,
                              suffix: '',
                              showIcon: true,
                              showPassword: false,
                              isPassword: false,
                              inputType: TextInputType.text,
                              controller: cardController.nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'يرجى إدخال الإسم';
                                }
                                return null;
                              },
                            )),
                      ],
                    ),
                    SizedBox(
                      // margin: const EdgeInsets.symmetric(vertical: 8),
                      // width: double.infinity,
                      // height: 50,
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomDropdownButton(
                              label: '',
                              showLabel: false,
                              value: cardController.nationality,
                              items: cardController.arabicNationalities,
                              onChanged: (String? value) {
                                cardController
                                    .nationalityIdController
                                    .text = value!;
                                cardController.fatherNationality = value!;
                                cardController.update();
                              },
                            ),
                          ),

                          // const SizedBox(width: 5,),
                          Expanded(
                              child: CustomTextField(
                            context: context,
                            initialValue: 'اللقب  ',
                            icon: Icons.message,
                            suffix: '',
                            showPassword: false,
                            isPassword: false,
                            inputType: TextInputType.text,
                            controller: cardController.nickNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'يرجى إدخال اللقب';
                              }
                              return null;
                            },
                          )),
                        ],
                      ),
                    ),
                ]
                        )
                        ),
                    const SizedBox(
                      height: 10,
                    ),

                    Container(

                      decoration: BoxDecoration(

                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        children: [
                          Row(

                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: CustomDropdownButton(
                                  label: 'بيانات  الأب',
                                  showLabel: true,
                                  value: cardController.fatherHaveId,
                                  items: const ['يمتلك', 'لايمتلك'],
                                  onChanged: (String? value) {
                                    cardController.fatherHaveId = value!;
                                    cardController.update();
                                  },
                                ),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 25),
                                    child: CustomTextField(
                                      context: context,
                                      initialValue: '  الرقم الوطني ',
                                      icon: Icons.message,
                                      suffix: '',
                                      showPassword: false,
                                      isPassword: false,
                                      inputType: TextInputType.text,
                                      controller: cardController.fatherIdController,
                                    ),
                                  )),
                            ],
                          ),
                          Container(
                            // margin: const EdgeInsets.symmetric(vertical: 3),
                            width: double.infinity,
                            // height: 50,
                            child: Row(
                              children: [
                                Expanded(
                                    child: CustomTextField(
                                  context: context,
                                  initialValue: ' اسم الاب ',
                                  icon: Icons.message,
                                  suffix: '',
                                  showPassword: false,
                                  isPassword: false,
                                  inputType: TextInputType.text,
                                  controller: cardController.fatherNameController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'يرجى إدخال  اسم الاب ';
                                        }
                                        return null;
                                      },
                                )),
                                Expanded(
                                    child: CustomTextField(
                                  context: context,
                                  initialValue: ' اسم الجد ',
                                  icon: Icons.message,
                                  suffix: '',
                                  showPassword: false,
                                  isPassword: false,
                                  inputType: TextInputType.text,
                                  controller: cardController.grandFatherNameController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'يرجى إدخال  اسم الجد  ';
                                        }
                                        return null;
                                      },
                                )),
                              ],
                            ),
                          ),
                          Container(
                            // margin: const EdgeInsets.only(top:5),
                            width: double.infinity,
                            // height: 50,
                            child: Row(
                              children: [
                                Expanded(
                                    child: CustomTextField(
                                  context: context,
                                  initialValue: '  الجد الثالث ',
                                  icon: Icons.message,
                                  suffix: '',
                                  showPassword: false,
                                  isPassword: false,
                                  inputType: TextInputType.text,
                                  controller:
                                      cardController.fatherThirdNameController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'يرجى إدخال  اسم الجد الثالث ';
                                        }
                                        return null;
                                      },
                                )),
                                // const SizedBox(width: 5,),
                                Expanded(
                                    child: CustomTextField(
                                  context: context,
                                  initialValue: 'اللقب  ',
                                  icon: Icons.message,
                                  suffix: '',
                                  showPassword: false,
                                  isPassword: false,
                                  inputType: TextInputType.text,
                                  controller:
                                      cardController.fatherNickNameController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'يرجى إدخال  اللقب ';
                                        }
                                        return null;
                                      },
                                )),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 0),
                            // padding: EdgeInsets.only(top: 5),
                            width: double.infinity,
                            // height: 80,
                            child: Row(
                              children: [
                                Expanded(
                                  child: CustomDropdownButton(
                                    label: '',
                                    showLabel: false,
                                    value: cardController.fatherNationality,
                                    items: cardController.arabicNationalities,
                                    onChanged: (String? value) {
                                      cardController
                                          .fatherNationalityIdController
                                          .text = value!;
                                      cardController.fatherNationality = value!;
                                      cardController.update();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // end father data
                    //start mother
                    const SizedBox(
                      height: 15,
                    ),

                    Container(
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: CustomDropdownButton(
                                  label: 'بيانات  الأم',
                                  showLabel: true,
                                  value: cardController.motherHaveId,
                                  items: ['يمتلك', 'لايمتلك'],
                                  onChanged: (String? value) {
                                    cardController.motherHaveId = value!;
                                    cardController.update();
                                    // cardController.genderController.text = value!;
                                  },
                                ),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 25),
                                    child: CustomTextField(
                                      context: context,
                                      initialValue: '  الرقم الوطني ',
                                      icon: Icons.message,
                                      suffix: '',
                                      showPassword: false,
                                      isPassword: false,
                                      inputType: TextInputType.text,
                                      controller:
                                          cardController.motherIdController,
                                    ),
                                  )),
                            ],
                          ),
                          Container(
                            // margin: const EdgeInsets.symmetric(vertical: 5),
                            width: double.infinity,
                            // height: 50,
                            child: Row(
                              children: [
                                Expanded(
                                    child: CustomTextField(
                                  context: context,
                                  initialValue: ' اسم الأم ',
                                  icon: Icons.message,
                                  suffix: '',
                                  showPassword: false,
                                  isPassword: false,
                                  inputType: TextInputType.text,
                                  controller:
                                      cardController.motherNameController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'يرجى إدخال  اسم الأم ';
                                        }
                                        return null;
                                      },

                                )),
                                Expanded(
                                    child: CustomTextField(
                                  context: context,
                                  initialValue: ' اسم الجد ',
                                  icon: Icons.message,
                                  suffix: '',
                                  showPassword: false,
                                  isPassword: false,
                                  inputType: TextInputType.text,
                                  controller:
                                      cardController.grandMotherNameController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'يرجى إدخال  اسم الجد  ';
                                        }
                                        return null;
                                      },
                                )),
                              ],
                            ),
                          ),
                          Container(
                            // margin: const EdgeInsets.symmetric(vertical: 5),
                            width: double.infinity,
                            // height: 50,
                            child: Row(
                              children: [
                                Expanded(
                                    child: CustomTextField(
                                  context: context,
                                  initialValue: '  الجد الثالث ',
                                  icon: Icons.message,
                                  suffix: '',
                                  showPassword: false,
                                  isPassword: false,
                                  inputType: TextInputType.text,
                                  controller:
                                      cardController.motherThirdNameController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'يرجى إدخال  اسم الجد الثالث ';
                                        }
                                        return null;
                                      },
                                )),
                                Expanded(
                                    child: CustomTextField(
                                  context: context,
                                  initialValue: 'اللقب  ',
                                  icon: Icons.message,
                                  suffix: '',
                                  showPassword: false,
                                  isPassword: false,
                                  inputType: TextInputType.text,
                                  controller:
                                      cardController.motherNickNameController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'يرجى إدخال  اللقب';
                                        }
                                        return null;
                                      },
                                )),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 0),
                            // padding: EdgeInsets.only(top: 5),
                            width: double.infinity,
                            // height: 80,
                            child: Row(
                              children: [
                                Expanded(
                                  child: CustomDropdownButton(
                                    label: '',
                                    showLabel: false,
                                    value: cardController.motherNationality,
                                    items: cardController.arabicNationalities,
                                    onChanged: (String? value) {
                                      cardController
                                          .motherNationalityIdController
                                          .text = value!;
                                      cardController.motherNationality = value!;
                                      cardController.update();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    //

                    //end mother data
                     Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "عنوان الميلاد ",
                          style: TextStyle(
                            fontFamily: 'NotoKufiArabic',
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                    //start cascading
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.indigo.shade900.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            child: DropdownButton<Country>(
                              dropdownColor: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              iconDisabledColor: Colors.black,
                              iconEnabledColor: Colors.black,
                              style: const TextStyle(
                                fontFamily: 'NotoKufiArabic',
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                              value: cardController.selectedCountryBirth,
                              onChanged: cardController.onCountryBirthChanged,
                              isExpanded: true,
                              underline: const SizedBox(),
                              items: cardController.countries
                                  .map((country) => DropdownMenuItem<Country>(
                                        alignment: Alignment.centerRight,
                                        value: country,
                                        child: Text(
                                          country.name,
                                          style: const TextStyle(
                                            fontFamily: 'NotoKufiArabic',
                                            color: Colors.black,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.indigo.shade900.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            child: DropdownButton<Provinces>(
                              dropdownColor:Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              iconDisabledColor: Colors.black,
                              iconEnabledColor: Colors.black,
                              style: const TextStyle(
                                fontFamily: 'NotoKufiArabic',
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                              isExpanded: true,
                              underline: const SizedBox(),
                              value: cardController.selectedCityBirth,
                              onChanged: cardController.onCityBirthChanged,
                              items: cardController
                                  .selectedCountryBirth.provinces
                                  .map((city) => DropdownMenuItem<Provinces>(
                                        alignment: Alignment.centerRight,
                                        value: city,
                                        child: Text(
                                          city.name,
                                          style: const TextStyle(
                                            fontFamily: 'NotoKufiArabic',
                                            color: Colors.black,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: Colors.indigo.shade900.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              child: DropdownButton<Directories>(
                                dropdownColor: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                iconDisabledColor: Colors.black,
                                iconEnabledColor: Colors.black,
                                style: const TextStyle(
                                  fontFamily: 'NotoKufiArabic',
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                                isExpanded: true,
                                underline: const SizedBox(),
                                value: cardController.selectedDirectoryBirth,
                                onChanged:
                                    cardController.onDirectoryBirthChanged,
                                items: cardController
                                    .selectedCityBirth.directories
                                    .map((directory) =>
                                        DropdownMenuItem<Directories>(
                                          alignment: Alignment.centerRight,
                                          value: directory,
                                          child: Text(
                                            directory.name,
                                            style: const TextStyle(
                                              fontFamily: 'NotoKufiArabic',
                                              color: Colors.black,
                                              fontSize: 16.0,
                                            ),
                                            overflow: TextOverflow.fade,
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              width: double.infinity,
                              // height: 50,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: CustomTextField(
                                    context: context,
                                    initialValue: '  الحي /عزلة ',
                                    icon: Icons.person,
                                    suffix: '',
                                    showPassword: false,
                                    isPassword: false,
                                    inputType: TextInputType.text,
                                    controller:
                                        cardController.villageBirthController,
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //end cascading
                    // const SizedBox(height: 10,),

                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              // margin: const EdgeInsets.symmetric(vertical: 0),
                              padding:const EdgeInsets.symmetric(vertical: 0) ,
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomDropdownButton(
                                      label: 'الجنس',
                                      value: cardController.gender,
                                      items: ['ذكر', 'انثى'],
                                      onChanged: (String? value) {
                                        cardController.genderController.text =
                                            value!;
                                        cardController.gender = value!;
                                        cardController.update();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(top: 25),
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: cardController.dateOfBirthController,
                                //editing controller of this TextField
                                decoration: InputDecoration(

                                  // icon: Icon(Icons.calendar_today),
                                  labelText: 'تاريخ الميلاد ',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 5.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(15),
                                    // gapPadding: 10
                                  ),
                                  errorStyle: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(color: Colors.red),
                                  iconColor: Colors.black,
                                  suffixStyle:
                                      Theme.of(context).textTheme.titleMedium,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                  ),
                                  labelStyle:
                                      const TextStyle(color: Colors.black),
                                ),
                                readOnly: true,
                                //set it true, so that user will not able to edit text
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime(2100));

                                  if (pickedDate != null) {
                                    print(
                                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                    // String formattedDate =
                                    cardController.dateOfBirthController.text =
                                        pickedDate.toString();
                                    // DateFormat('yyyy-MM-dd').format(pickedDate);
                                    // print(formattedDate); //formatted date output using intl package =>  2021-03-16
                                    // setState(() {
                                    //   dateInput.text =
                                    // formattedDate; //set output date to TextField value.
                                    // });
                                  } else {}
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // const SizedBox(height: 10,),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 0),
                      padding: const EdgeInsets.symmetric(vertical: 0),

                      // padding: EdgeInsets.only(top: 5),
                      width: double.infinity,
                      // height: 50,
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomDropdownButton(
                              label: 'فصيلة الدم',
                              value: cardController.bloodType,
                              items: cardController.bloodTypes,
                              onChanged: (String? value) {
                                cardController.bloodTypeIdController.text =
                                    value!;
                                cardController.bloodType = value;
                                cardController.update();
                              },
                            ),
                          ),
                          Expanded(
                            child: CustomDropdownButton(
                              label: 'الحالة الاجتماعية',
                              value: cardController.maritalStatus,
                              items: ['اعزب'],
                              onChanged: (String? value) {
                                cardController.maritalStatusController.text =
                                    value!;
                                cardController.maritalStatus = value;
                                cardController.update();
                              },
                            ),
                          )
                        ],
                      ),
                    ),

                    // const SizedBox(height: 5,),

                    Container(
                      // padding: EdgeInsets.only(top: 5),
                      width: double.infinity,
                      // height: 80,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            margin: const EdgeInsets.only(top: 33),
                            child: CustomTextField(
                              context: context,
                              initialValue: 'رقم الهاتف',
                              icon: Icons.phone,
                              suffix: '',
                              showPassword: false,
                              isPassword: false,
                              inputType: TextInputType.phone,
                              controller: cardController.phoneController,
                              validator: (value){
                                if(value!.isEmpty||value==null){
                                  return "يرجى إدخال رقم الهاتف";
                                }
                              },
                            ),
                          )),
                          Expanded(
                            child: CustomDropdownButton(
                              label: 'الديانة',
                              value: cardController.religion,
                              items: ['مسلم'],
                              onChanged: (String? value) {
                                cardController.religionController.text = value!;
                                cardController.religion = value;
                                cardController.update();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "عنوان الاقامة ",
                          style: TextStyle(
                            fontFamily: 'NotoKufiArabic',
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                    // const CascadingDropdowns(),
                    // const SizedBox(height: 10,),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.indigo.shade900.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              child: DropdownButton<Country>(
                                dropdownColor: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                iconDisabledColor: Colors.black,
                                iconEnabledColor: Colors.black,
                                style: const TextStyle(
                                  fontFamily: 'NotoKufiArabic',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                                value: cardController.selectedCountryCurrent,
                                onChanged: cardController.onCountryCurrentChanged,
                                isExpanded: true,
                                underline: const SizedBox(),
                                items: cardController.countries
                                    .map((country) => DropdownMenuItem<Country>(
                                          alignment: Alignment.centerRight,
                                          value: country,
                                          child: Text(
                                            country.name,
                                            style: const TextStyle(
                                              fontFamily: 'NotoKufiArabic',
                                              color: Colors.black,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color:Colors.indigo.shade900.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              child: DropdownButton<Provinces>(
                                dropdownColor: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                // iconDisabledColor: Colors.white,
                                iconEnabledColor: Colors.black,
                                style: const TextStyle(
                                  fontFamily: 'NotoKufiArabic',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                                isExpanded: true,
                                underline: const SizedBox(),
                                value: cardController.selectedCityCurrent,
                                onChanged: cardController.onCityCurrentChanged,
                                items: cardController
                                    .selectedCountryCurrent.provinces
                                    .map((city) => DropdownMenuItem<Provinces>(
                                          alignment: Alignment.centerRight,
                                          value: city,
                                          child: Text(
                                            city.name,
                                            style: const TextStyle(
                                              fontFamily: 'NotoKufiArabic',
                                              color: Colors.black,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              // height: 50,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.indigo.shade900.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              child: DropdownButton<Directories>(
                                dropdownColor: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                iconDisabledColor: Colors.white,
                                iconEnabledColor: Colors.black,
                                style: const TextStyle(
                                  fontFamily: 'NotoKufiArabic',
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                                isExpanded: true,
                                underline: const SizedBox(),
                                value: cardController.selectedDirectoryCurrent,
                                onChanged:
                                    cardController.onDirectoryCurrentChanged,
                                items: cardController
                                    .selectedCityCurrent.directories
                                    .map((directory) =>
                                        DropdownMenuItem<Directories>(
                                          alignment: Alignment.centerRight,
                                          value: directory,
                                          child: Text(
                                            directory.name,
                                            overflow: TextOverflow.fade,
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // margin: const EdgeInsets.symmetric(vertical: 5),
                              width: double.infinity,
                              // height: 50,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: CustomTextField(
                                    context: context,
                                    initialValue: '  الحي/عزلة ',
                                    icon: Icons.person,
                                    suffix: '',
                                    showPassword: false,
                                    isPassword: false,
                                    inputType: TextInputType.text,
                                    controller: cardController
                                        .villageResidenceController,
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      // margin: const EdgeInsets.symmetric(vertical: 5),
                      // width: double.infinity,
                      // height: 50,
                      child: Row(
                        children: [
                          Expanded(
                              child: CustomTextField(
                            context: context,
                            initialValue: '  الشارع /القرية ',
                            icon: Icons.place,
                            suffix: '',
                            showPassword: false,
                            isPassword: false,
                            inputType: TextInputType.text,
                            controller: cardController.streetController,
                          )),
                          Expanded(
                              child: CustomTextField(
                            context: context,
                            initialValue: ' المنزل',
                            icon: Icons.home,
                            suffix: '',
                            showPassword: false,
                            isPassword: false,
                            inputType: TextInputType.text,
                            controller: cardController.homeController,
                          )),
                        ],
                      ),
                    ),

                    Container(
                      // margin: const EdgeInsets.only(top:10),
                      width: double.infinity,
                      // height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomDropdownButton(
                              label: 'الحالة التعليمية',
                              value: cardController.educationStatus,
                              items: ['أمي', 'متعلم'],
                              onChanged: (String? value) {
                                if(value=='أمي'){
                                  cardController.specializationController.text=value!;
                                  cardController.update();
                                }
                                else{

                                }
                                cardController.educationStatusController.text =
                                    value!;
                                cardController.educationStatus = value;
                                cardController.update();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              // margin:EdgeInsets.only(top:10),
                              child: CustomDropdownButton(
                                label: 'المستوى التعليمي',
                                value: cardController.educationLevel,
                                items: ['أساسي', 'إعدادي', 'ثانوية عامه', 'بكالوريوس', 'ماجستير', 'دكتوراه'],
                                onChanged: (String? value) {
                                  cardController.educationLevelController.text =
                                      value!;
                                  cardController.educationLevel = value;
                                  cardController.update();
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(top: 25),
                              width: double.infinity,
                              // height: 50,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: CustomTextField(
                                    context: context,
                                    initialValue: ' التخصص ',
                                    icon: Icons.save,
                                    suffix: '',
                                    showPassword: false,
                                    isPassword: false,
                                    inputType: TextInputType.phone,
                                    controller:
                                        cardController.specializationController,
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      // height: 50,
                      child: Row(
                        children: [
                          Expanded(
                              child: CustomTextField(
                            context: context,
                            initialValue: 'المهنة',
                            icon: Icons.save,
                            suffix: '',
                            showPassword: false,
                            isPassword: false,
                            inputType: TextInputType.phone,
                            controller: cardController.occupationController,
                          )),
                          Expanded(
                              child: CustomTextField(
                            context: context,
                            initialValue: 'جهة العمل ',
                            icon: Icons.save,
                            suffix: '',
                            showPassword: false,
                            isPassword: false,
                            inputType: TextInputType.phone,
                            controller: cardController.employerController,
                          )),
                        ],
                      ),
                    ),
                    // mother data

                    //end mother data
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "تقديم الطلب في محافظة / مديرية / فرع ",
                          style: TextStyle(
                              fontFamily: 'NotoKufiArabic', fontSize: 16),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color:  Colors.indigo.shade900.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            child: DropdownButton<Provinces>(
                              value: cardController.selectedCityBranch,
                              onChanged: cardController.onCityBranchChanged,
                              isExpanded: true,
                              dropdownColor: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              iconDisabledColor: Colors.black,
                              iconEnabledColor: Colors.black,
                              style: const TextStyle(
                                fontFamily: 'NotoKufiArabic',
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                              underline: const SizedBox(),
                              items: cardController.selectedCountryBranch.provinces
                                  .map((province) => DropdownMenuItem<Provinces>(
                                alignment: Alignment.centerRight,
                                value: province,
                                child: Text(
                                  province.name,
                                  style: const TextStyle(
                                    fontFamily: 'NotoKufiArabic',
                                    color: Colors.black,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ))
                                  .toList(),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color:Colors.indigo.shade900.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            child: DropdownButton<Directories>(
                              isExpanded: true,
                              underline: const SizedBox(),
                              dropdownColor: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              iconDisabledColor: Colors.black,
                              iconEnabledColor: Colors.black,
                              style: const TextStyle(
                                fontFamily: 'NotoKufiArabic',
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                              value: cardController.selectedDirectoryBranch,
                              onChanged: cardController.onDirectoryBranchChanged,
                              items: cardController
                                  .selectedCityBranch.directories
                                  .map((city) => DropdownMenuItem<Directories>(
                                alignment: Alignment.centerRight,
                                value: city,
                                child: Text(
                                  city.name,
                                  style: const TextStyle(
                                    fontFamily: 'NotoKufiArabic',
                                    color: Colors.black,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ))
                                  .toList(),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.indigo.shade900.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            child: DropdownButton<Branches>(
                              isExpanded: true,
                              dropdownColor: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              iconDisabledColor: Colors.black,
                              iconEnabledColor: Colors.black,
                              underline: const SizedBox(),
                              value: cardController.selectedBranch,
                              onChanged: cardController.onBranchChanged,
                              items: cardController
                                  .selectedDirectoryBranch.branches
                                  .map((city) => DropdownMenuItem<Branches>(
                                alignment: Alignment.centerRight,
                                value: city,
                                child: Text(
                                  city.name,
                                  style: const TextStyle(
                                    fontFamily: 'NotoKufiArabic',
                                    color: Colors.black,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ))
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 1,
                      child: MaterialButton(
                        height: 50,
                        shape: BeveledRectangleBorder(
                          borderRadius:BorderRadius.all(Radius.circular(5))
                        ),
                        onPressed: () {
                         if(_formKey.currentState!.validate()){
                             cardController.requestIdCard();
                            //  Get.to(StepTwoScreen());

                          }
                        },
                        child: const Text(
                          "إرسال الطلب  ",
                          style: TextStyle(color: Colors.white,fontFamily: 'NotoKufiArabic',fontWeight: FontWeight.bold,fontSize: 15),
                        ),
                        color: Colors.green,
                      ),
                    ),

                    // CascadingDropdowns(),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
