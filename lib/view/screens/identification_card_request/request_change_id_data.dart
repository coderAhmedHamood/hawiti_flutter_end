// import 'package:clothes/controllers/RequestIdController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawiti/resources/constant.dart';
import 'package:hawiti/view/screens/identification_card_request/step_2_screen.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
// import 'package:intl/intl.dart';

import '../../../controllers/id_card_controller.dart';
import '../../../model/country_model.dart';
import '../../../models/country.dart';
import '../../widgets/CustomTextField.dart';
import '../../widgets/cascade_dropdown.dart';
import '../../widgets/custom_drop_down.dart';

// import '../widgets/custom_text_field.dart';
IdCardController requestIdController = Get.find();

class requestChangeIdDataScreen extends StatelessWidget {
  requestChangeIdDataScreen({Key? key}) : super(key: key);

  TextEditingController dateInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "تقديم طلب بطاقة شخصية  تغيير بيان  ",
          style: TextStyle(fontFamily: 'Cairo'),
        ),

        //    // SizedBox(height: 10,),
        //         /,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                          "   بيانات  الفرع السابق للبطاقة",
                          style: TextStyle(fontFamily: 'Cairo', fontSize: 18)),
                      SizedBox(width: 20,),

                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 5, vertical: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      value: requestIdController.selectedCityBirth,
                      onChanged: requestIdController.onCityBirthChanged,
                      items:
                          requestIdController.selectedCountryBirth.provinces
                              .map((city) => DropdownMenuItem<Provinces>(
                                    alignment: Alignment.centerRight,
                                    value: city,
                                    child: Text(city.name),
                                  ))
                              .toList(),
                    ),
                  ),
                  Container(
                    // height: 50,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 5, vertical: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      value: requestIdController.selectedDirectoryBirth,
                      onChanged:
                          requestIdController.onDirectoryBirthChanged,
                      items: requestIdController
                          .selectedCityBirth.directories
                          .map((directory) => DropdownMenuItem<Directories>(
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
                  Container(
                    // height: 50,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 5, vertical: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      value: requestIdController.selectedDirectoryBirth,
                      onChanged:
                          requestIdController.onDirectoryBirthChanged,
                      items: requestIdController
                          .selectedCityBirth.directories
                          .map((directory) => DropdownMenuItem<Directories>(
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
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      SizedBox(width: 10,),
                      Text(
                          "البيانات الشخصية",
                          style: TextStyle(fontFamily: 'Cairo', fontSize: 18)),
                      SizedBox(width: 20,),

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
                          controller: requestIdController.idController,
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
                          initialValue: ' رقم الهاتف',
                          icon: Icons.person,
                          suffix: '',
                          showPassword: false,
                          isPassword: false,
                          inputType: TextInputType.number,
                          controller: requestIdController.phoneController,
                        )),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      SizedBox(width: 10,),
                      Text("   بيانات  الفرع المقدم له الطلب", style: TextStyle(fontFamily: 'Cairo', fontSize: 18)),
                      SizedBox(width: 20,),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 5, vertical: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      value: requestIdController.selectedCityBirth,
                      onChanged: requestIdController.onCityBirthChanged,
                      items:
                      requestIdController.selectedCountryBirth.provinces
                          .map((city) => DropdownMenuItem<Provinces>(
                        alignment: Alignment.centerRight,
                        value: city,
                        child: Text(city.name),
                      ))
                          .toList(),
                    ),
                  ),
                  Container(
                    // height: 50,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 5, vertical: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      value: requestIdController.selectedDirectoryBirth,
                      onChanged:
                      requestIdController.onDirectoryBirthChanged,
                      items: requestIdController
                          .selectedCityBirth.directories
                          .map((directory) => DropdownMenuItem<Directories>(
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
                  Container(
                    // height: 50,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 5, vertical: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      value: requestIdController.selectedDirectoryBirth,
                      onChanged:
                      requestIdController.onDirectoryBirthChanged,
                      items: requestIdController
                          .selectedCityBirth.directories
                          .map((directory) => DropdownMenuItem<Directories>(
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
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      SizedBox(width: 10,),
                      Text(
                          " صورة البطاقة",
                          style: TextStyle(fontFamily: 'Cairo', fontSize: 18)),
                      SizedBox(width: 20,),

                    ],
                  ),
                  InkWell(
                    onTap: () {
                      controller.showPickImageDialog(context);
                      // _pickImage(ImageSource.gallery);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                      // padding: EdgeInsets.only(top: 5),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white60,
                        border: Border.all(width: 2),
                      ),
                      width: double.infinity,
                      height: 250,
                      child: Icon(
                        Icons.image,
                        size: 50,
                        weight: 1,
                      ),
                    ),
                  ),
                  if (controller.imageFile != null)
                    Image.file(
                      controller.imageFile!,
                      height: 200,
                    ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      SizedBox(width: 10,),
                      Text(
                          "البيانات المطلوب تغييرها",
                          style: TextStyle(fontFamily: 'Cairo', fontSize: 18)),
                      SizedBox(width: 20,),

                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Table(
                      border: TableBorder.all(width: 2),
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(1),
                        2: FlexColumnWidth(1.5),
                      },
                      children: [
                        TableRow(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                            ),
                            children: const [
                              Text(
                                ' البيانات الجديدة',
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                ' البيانات السابقة',
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                ' البيان المطلوب تغييره',
                                style: TextStyle(fontSize: 15),
                              ),
                            ]),
                        const TableRow(children: [
                          TextField(
                            style: TextStyle(fontSize: 14),
                            maxLines: 3,
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              labelText: '',
                            ),
                          ),
                          // CustomTextField(context: context, initialValue: '', icon: Icons.add, suffix: '', showPassword: false, controller: requestIdController.provinceIdLostCon, isPassword: false, inputType: TextInputType.text),
                          TextField(
                            style: TextStyle(fontSize: 14),
                            maxLines: 3,
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              labelText: '',
                            ),
                          ),
                          TextField(
                            style: TextStyle(fontSize: 14),
                            maxLines: 3,
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              labelText: '',
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: MaterialButton(
                      onPressed: () {
                        // Get.to(stepTwoScreen());
                        // requestIdController.
                        // requestIdController.ch
                        ///todo call funtion change data
                      },
                      child: const Text(
                        " حفظ",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.indigo.shade900,
                    ),
                  ),
                  SizedBox(height: 10,),
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
