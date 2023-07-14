// import 'package:clothes/controllers/RequestIdController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawiti/controllers/id_card_controller.dart';
import 'package:hawiti/resources/constant.dart';
import 'package:hawiti/view/screens/identification_card_request/step_2_screen.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
// import 'package:intl/intl.dart';

import '../../../controllers/death_card_controller.dart';
import '../../../model/country_model.dart';
import '../../../models/country.dart';
import '../../widgets/CustomTextField.dart';
import '../../widgets/cascade_dropdown.dart';
import '../../widgets/custom_drop_down.dart';


// import '../widgets/custom_text_field.dart';
DeathController requestDeathController = Get.put(DeathController());
IdCardController idcontroller = Get.find();

class requestDeathScreen extends StatelessWidget {
  requestDeathScreen({Key? key}) : super(key: key);

  TextEditingController dateInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "تقديم طلب شهادة وفاة  ",
            style: TextStyle(fontFamily: 'Cairo'),
          ),
      ),
      body:
      SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetBuilder<IdCardController>(builder: (controller) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      SizedBox(width: 10,),
                      Text(
                          "بيانات  الفرع",
                          style: TextStyle(fontFamily: 'Cairo', fontSize: 18)),
                      SizedBox(width: 20,),

                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),

                          padding: const EdgeInsets.symmetric(
                              horizontal: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          child: DropdownButton<Provinces>(
                            isExpanded: true,
                            underline: const SizedBox(),
                            value: idcontroller.selectedCityBirth,
                            onChanged: idcontroller
                                .onCityBirthChanged,
                            items: idcontroller.selectedCountryBirth
                                .provinces
                                .map((city) =>
                                DropdownMenuItem<Provinces>(
                                  alignment: Alignment.centerRight,
                                  value: city,
                                  child: Text(city.name),
                                ))
                                .toList(),
                          ),
                        ),
                      ),




                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child:   Container(
                        height: 50,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: DropdownButton<Directories>(
                          isExpanded: true,
                          underline: const SizedBox(),
                          value: idcontroller
                              .selectedDirectoryBirth,
                          onChanged: idcontroller
                              .onDirectoryBirthChanged,
                          items: idcontroller.selectedCityBirth
                              .directories
                              .map((directory) =>
                              DropdownMenuItem<Directories>(
                                alignment: Alignment.centerRight,
                                value: directory,
                                child: Text(
                                  directory.name,
                                  overflow: TextOverflow.fade,),
                              ))
                              .toList(),
                        ),
                      ),),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child:   Container(
                        height: 50,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: DropdownButton<Directories>(
                          isExpanded: true,
                          underline: const SizedBox(),
                          value: idcontroller
                              .selectedDirectoryBirth,
                          onChanged: idcontroller
                              .onDirectoryBirthChanged,
                          items: idcontroller.selectedCityBirth
                              .directories
                              .map((directory) =>
                              DropdownMenuItem<Directories>(
                                alignment: Alignment.centerRight,
                                value: directory,
                                child: Text(
                                  directory.name,
                                  overflow: TextOverflow.fade,),
                              ))
                              .toList(),
                        ),
                      ),),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [

                      SizedBox(height: 10,),

                    ],
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
                              initialValue: '  الرقم الوطني ',
                              icon: Icons.person,
                              suffix: '',
                              showPassword: false,
                              isPassword: false,
                              inputType: TextInputType.number,
                              controller: requestDeathController.idController,

                            )),

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
                              initialValue: ' رقم الهاتف',
                              icon: Icons.person,
                              suffix: '',
                              showPassword: false,
                              isPassword: false,
                              inputType: TextInputType.number,
                              controller: requestDeathController.idController,

                            )),

                      ],
                    ),
                  ),

                  // const CascadingDropdowns(),
                  //start cascading


                  //end cascading
                  const SizedBox(height: 10,),





                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 0),
                    // padding: EdgeInsets.only(top: 5),
                    width: double.infinity,
                    // height: 50,
                    child:Icon(Icons.image,size: 200,) ,
                  ),


                  const SizedBox(height: 5,),

                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.9,
                    child: MaterialButton(onPressed: () {
                      // Get.to(stepTwoScreen());
                      // requestIdController.
                      ///todo call funtion add REquestId Lost
                    }, child: const Text(" حفظ", style: TextStyle(
                        color: Colors.white),),
                      color: Colors.indigo.shade900,
                    ),
                  ),
                  // CascadingDropdowns(),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
