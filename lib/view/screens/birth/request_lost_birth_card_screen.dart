import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../controllers/birth_controller.dart';
import '../../../controllers/id_card_controller.dart';
import '../../../model/country_model.dart';
import '../../../models/country.dart';
import '../../../resources/constant.dart';
import '../../widgets/CustomTextField.dart';
import '../../widgets/custom_drop_down.dart';
import '../identification_card_request/renew_id_screen.dart';

BirthController birthController = Get.put(BirthController());
IdCardController idcontroller = Get.find();

class requestLostBirthCardScreen extends StatelessWidget {
  requestLostBirthCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IdCardController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "تقديم طلب بطاقة ميلاد بدل فاقد ",
            style: TextStyle(fontFamily: 'NotoKufiArabic'),
          ),
        ),
        body: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
              // GetBuilder<BirthController>(builder: (controller) {
              //   return
              GetBuilder<IdCardController>(
                builder: (logic) {
                  return Column(
                    children: [
                       Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 10,),
                          Text(
                              "تقديم الطلب إلى محافظة / مديرية / فرع ",
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
                       Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 10,),
                          Text(
                              " الفرع  الذي أصدرت منه الشهادة السابقة",
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
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: const [
                      //     SizedBox(width: 10,),
                      //     Text(
                      //         "بيانات  الفرع",
                      //         style: TextStyle(fontFamily: 'Cairo', fontSize: 18)),
                      //     SizedBox(width: 20,),
                      //
                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: Container(
                      //         margin: const EdgeInsets.symmetric(
                      //             horizontal: 5, vertical: 5),
                      //
                      //         padding: const EdgeInsets.symmetric(
                      //             horizontal: 16),
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(8),
                      //           border: Border.all(
                      //             color: Colors.black,
                      //             width: 1,
                      //           ),
                      //         ),
                      //         child: DropdownButton<Provinces>(
                      //           isExpanded: true,
                      //           underline: const SizedBox(),
                      //           value: idcontroller.selectedCityBirth,
                      //           onChanged: idcontroller
                      //               .onCityBirthChanged,
                      //           items: idcontroller.selectedCountryBirth
                      //               .provinces
                      //               .map((city) =>
                      //               DropdownMenuItem<Provinces>(
                      //                 alignment: Alignment.centerRight,
                      //                 value: city,
                      //                 child: Text(city.name),
                      //               ))
                      //               .toList(),
                      //         ),
                      //       ),
                      //     ),
                      //
                      //
                      //
                      //
                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     Expanded(child:   Container(
                      //       height: 50,
                      //       margin: const EdgeInsets.symmetric(
                      //           horizontal: 5, vertical: 5),
                      //       padding: const EdgeInsets.symmetric(
                      //           horizontal: 16),
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(8),
                      //         border: Border.all(
                      //           color: Colors.black,
                      //           width: 1,
                      //         ),
                      //       ),
                      //       child: DropdownButton<Directories>(
                      //         isExpanded: true,
                      //         underline: const SizedBox(),
                      //         value: idcontroller
                      //             .selectedDirectoryBirth,
                      //         onChanged: idcontroller
                      //             .onDirectoryBirthChanged,
                      //         items: idcontroller.selectedCityBirth
                      //             .directories
                      //             .map((directory) =>
                      //             DropdownMenuItem<Directories>(
                      //               alignment: Alignment.centerRight,
                      //               value: directory,
                      //               child: Text(
                      //                 directory.name,
                      //                 overflow: TextOverflow.fade,),
                      //             ))
                      //             .toList(),
                      //       ),
                      //     ),),
                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     Expanded(child:   Container(
                      //       height: 50,
                      //       margin: const EdgeInsets.symmetric(
                      //           horizontal: 5, vertical: 5),
                      //       padding: const EdgeInsets.symmetric(
                      //           horizontal: 16),
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(8),
                      //         border: Border.all(
                      //           color: Colors.black,
                      //           width: 1,
                      //         ),
                      //       ),
                      //       child: DropdownButton<Directories>(
                      //         isExpanded: true,
                      //         underline: const SizedBox(),
                      //         value: idcontroller
                      //             .selectedDirectoryBirth,
                      //         onChanged: idcontroller
                      //             .onDirectoryBirthChanged,
                      //         items: idcontroller.selectedCityBirth
                      //             .directories
                      //             .map((directory) =>
                      //             DropdownMenuItem<Directories>(
                      //               alignment: Alignment.centerRight,
                      //               value: directory,
                      //               child: Text(
                      //                 directory.name,
                      //                 overflow: TextOverflow.fade,),
                      //             ))
                      //             .toList(),
                      //       ),
                      //     ),),
                      //   ],
                      // ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: double.infinity,
                        // height: 50,
                        child: Row(
                          children: [
                            Expanded(
                                child: CustomTextField(
                                  context: context,
                                  initialValue: 'الرقم الوطني لمقدم الطلب',
                                  icon: Icons.person,
                                  suffix: '',
                                  showPassword: false,
                                  isPassword: false,
                                  inputType: TextInputType.text,
                                  controller: birthController.personIdReqCon,

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
                                  initialValue: '  رقم الشهادة ',
                                  icon: Icons.person,
                                  suffix: '',
                                  showPassword: false,
                                  isPassword: false,
                                  inputType: TextInputType.number,
                                  controller: birthController.docNoCon,

                                )),

                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        child: MaterialButton(
                          height: 50,
                          shape: BeveledRectangleBorder(
                              borderRadius:BorderRadius.all(Radius.circular(5))
                          ),
                          onPressed: () {
                            birthController.prevBranchId=controller.selectedPrevBranch.id.toString();
                            birthController.branch=controller.selectedBranch.id;
                            birthController.addLostBirthCard();

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
                },
              ),
              // }),
            ),
          ),
        ),


      );
    });
  }
}
