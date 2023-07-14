import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawiti/resources/constant.dart';
import 'package:hawiti/view/screens/identification_card_request/step_2_screen.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
// import 'package:intl/intl.dart';

import '../../../controllers/family_card_controller.dart';
import '../../../controllers/id_card_controller.dart';
import '../../../model/country_model.dart';
import '../../../models/country.dart';
import '../../widgets/CustomTextField.dart';
import '../../widgets/cascade_dropdown.dart';
import '../../widgets/custom_drop_down.dart';

// import '../widgets/custom_text_field.dart';

class RequestLostFamilyCardScreen extends StatelessWidget {
  RequestLostFamilyCardScreen({Key? key}) : super(key: key);

  IdCardController requestIdController = Get.find();
  FamilyCardController familyCardController = Get.put(FamilyCardController());
  Future<void> _launchInBrowser() async {
    final Uri url = Uri.parse('https://cra.gov.ye/index.php?sub=family_card_damaged_lost');

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
            "تقديم طلب بطاقة عائلية بدل فاقد  ",
            style: TextStyle(fontFamily: 'NotoKufiArabic'),
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


                   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10,),
                      Text(
                          " الفرع السابق الذي أصدرت منه البطاقة",
                          style: TextStyle(fontFamily: 'NotoKufiArabic', fontSize: 18)),
                      SizedBox(width: 20,),

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
                            value: requestIdController.selectedCityPrevBranch,
                            onChanged: requestIdController.onCityBranchPrevChanged,
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
                            items: requestIdController.selectedCountryPrevBranch.provinces
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
                            value: requestIdController.selectedDirectoryPrevBranch,
                            onChanged: requestIdController.onDirectoryBranchPrevChanged,
                            items: requestIdController
                                .selectedCityPrevBranch.directories
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
                            value: requestIdController.selectedPrevBranch,
                            onChanged: requestIdController.onBranchPrevChanged,
                            items: requestIdController
                                .selectedDirectoryPrevBranch.branches
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


                  // Container(
                  //   margin: const EdgeInsets.symmetric(
                  //       horizontal: 5, vertical: 5),
                  //   padding: const EdgeInsets.symmetric(horizontal: 16),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8),
                  //     border: Border.all(
                  //       color: Colors.black,
                  //       width: 1,
                  //     ),
                  //   ),
                  //   child: DropdownButton<Provinces>(
                  //     isExpanded: true,
                  //     underline: const SizedBox(),
                  //     value: requestIdController.selectedCityBirth,
                  //     onChanged: requestIdController.onCityBirthChanged,
                  //     items:
                  //     requestIdController.selectedCountryBirth.provinces
                  //         .map((city) => DropdownMenuItem<Provinces>(
                  //       alignment: Alignment.centerRight,
                  //       value: city,
                  //       child: Text(city.name),
                  //     ))
                  //         .toList(),
                  //   ),
                  // ),
                  // Container(
                  //   height: 50,
                  //   margin: const EdgeInsets.symmetric(
                  //       horizontal: 5, vertical: 5),
                  //   padding: const EdgeInsets.symmetric(horizontal: 16),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8),
                  //     border: Border.all(
                  //       color: Colors.black,
                  //       width: 1,
                  //     ),
                  //   ),
                  //   child: DropdownButton<Directories>(
                  //     isExpanded: true,
                  //     underline: const SizedBox(),
                  //     value: requestIdController.selectedDirectoryBirth,
                  //     onChanged:
                  //     requestIdController.onDirectoryBirthChanged,
                  //     items: requestIdController
                  //         .selectedCityBirth.directories
                  //         .map((directory) => DropdownMenuItem<Directories>(
                  //       alignment: Alignment.centerRight,
                  //       value: directory,
                  //       child: Text(
                  //         directory.name,
                  //         overflow: TextOverflow.fade,
                  //       ),
                  //     ))
                  //         .toList(),
                  //   ),
                  // ),
                  // Container(
                  //   height: 50,
                  //   margin: const EdgeInsets.symmetric(
                  //       horizontal: 5, vertical: 5),
                  //   padding: const EdgeInsets.symmetric(horizontal: 16),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8),
                  //     border: Border.all(
                  //       color: Colors.black,
                  //       width: 1,
                  //     ),
                  //   ),
                  //   child: DropdownButton<Directories>(
                  //     isExpanded: true,
                  //     underline: const SizedBox(),
                  //     value: requestIdController.selectedDirectoryBirth,
                  //     onChanged:
                  //     requestIdController.onDirectoryBirthChanged,
                  //     items: requestIdController
                  //         .selectedCityBirth.directories
                  //         .map((directory) => DropdownMenuItem<Directories>(
                  //       alignment: Alignment.centerRight,
                  //       value: directory,
                  //       child: Text(
                  //         directory.name,
                  //         overflow: TextOverflow.fade,
                  //       ),
                  //     ))
                  //         .toList(),
                  //   ),
                  // ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10,),
                      Text(
                          "بيانات  البطاقة",
                          style: TextStyle(fontFamily: 'NotoKufiArabic', fontSize: 18)),
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
                          controller: familyCardController.personIdController,
                        )),
                      ],
                    ),
                  ),
                  // Container(
                  //   margin: const EdgeInsets.symmetric(vertical: 5),
                  //   width: double.infinity,
                  //   // height: 50,
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //           child: CustomTextField(
                  //         context: context,
                  //         initialValue: '  تاريخ الإصدار ',
                  //         icon: Icons.person,
                  //         suffix: '',
                  //         showPassword: false,
                  //         isPassword: false,
                  //         inputType: TextInputType.datetime,
                  //         controller: familyCardController.personIdController,
                  //       )),
                  //     ],
                  //   ),
                  // ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    // height: 50,
                    child: Row(
                      children: [
                        Expanded(
                            child: CustomTextField(
                              context: context,
                              initialValue: '   رقم البطاقة السابقة ',
                              icon: Icons.person,
                              suffix: '',
                              showPassword: false,
                              isPassword: false,
                              inputType: TextInputType.datetime,
                              controller: familyCardController.familyCardPrevIdController,
                            )),
                      ],
                    ),
                  ),

                  // const CascadingDropdowns(),
                  //start cascading


                  //end cascading
                   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 20,),
                      Text(
                          "- صورة البطاقة ",
                          style: TextStyle(fontFamily: 'NotoKufiArabic', fontSize: 18)),
                      SizedBox(width: 20,),

                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: () {
                      controller.showPickImageDialog(context);
                      // _pickImage(ImageSource.gallery);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 10),
                      // padding: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: Colors.white60,
                        border: Border.all(width: 2),
                      ),
                      width: double.infinity,
                      height: 40,
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          const Icon(
                            Icons.add_circle,
                            size: 30,
                            weight: 1,
                          ),
                          Text('إرفاق صوره',style: TextStyle(fontFamily: 'NotoKufiArabic', fontSize: 18)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),

                  if (controller.imageFile != null)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          controller.imageFile!,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10,),
                      Text(
                          "تقديم الطلب إلى : ",
                          style: TextStyle(fontFamily: 'NotoKufiArabic', fontSize: 18,fontWeight: FontWeight.bold)),

                      SizedBox(width: 20,),

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
                            value: requestIdController.selectedCityBranch,
                            onChanged: requestIdController.onCityBranchChanged,
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
                            items: requestIdController.selectedCountryBranch.provinces
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
                            value: requestIdController.selectedDirectoryBranch,
                            onChanged: requestIdController.onDirectoryBranchChanged,
                            items: requestIdController
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
                            value: requestIdController.selectedBranch,
                            onChanged: requestIdController.onBranchChanged,
                            items: requestIdController
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
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    child: MaterialButton(
                      height: 50,
                      shape: BeveledRectangleBorder(
                          borderRadius:BorderRadius.all(Radius.circular(5))
                      ),
                      onPressed: () {
                        // Get.to(stepTwoScreen());
                        // requestIdController.
                        familyCardController.prevBranchId=controller.selectedPrevBranch.id.toString();
                        familyCardController.branchId=controller.selectedBranch.id;
                        // familyCardController.directorateCurrentId=controller.selectedDirectoryCurrent.id;
                        // familyCardController.provinceCurrentId=controller.selectedCityCurrent.id;
                        familyCardController.requestFamilyCardLost();
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
    );
  }
}
