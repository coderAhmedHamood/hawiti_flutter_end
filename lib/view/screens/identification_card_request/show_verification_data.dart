import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/id_card_controller.dart';
import '../../../controllers/verify_controller.dart';
import '../../widgets/CustomTextField.dart';
import '../../widgets/text/big_text.dart';
class ShowVerificationDataScreen extends StatelessWidget {
   ShowVerificationDataScreen({Key? key}) : super(key: key);
  VerifyController controller=Get.find();
  IdCardController idCardController =Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          " بيانات  الطلب  ",
          style: TextStyle(fontFamily: 'Cairo'),
        ),
        //    // SizedBox(height: 10,),
        //         /,
      ),
      body:
      Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          scrollDirection:Axis.vertical ,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetBuilder<VerifyController>(builder: (controller) {
              return Column(
                textDirection: TextDirection.rtl,
                children: [
                  Row(
                    children: [
                      BigText(text: 'الاسم:',),
                      BigText(text: controller.verifyData.person.firstName+controller.verifyData.person.secondName,),

                    ],
                  ),
                  Row(
                    children: [
                      BigText(text: 'اسم الأم:',),
                      BigText(text: controller.verifyData.person.motherFullName),

                    ],
                  ),
                  Row(
                    children: [
                      BigText(text: ' تاريخ الميلاد:',),
                      BigText(text: controller.verifyData.person.dateOfBirth),

                    ],
                  ),
                  Row(
                    children: [
                      BigText(text: '  محل الميلاد :',),
                      BigText(text: controller.verifyData.person.address.where((element) => element.type==1).first.country.name+" - "),
                      BigText(text: controller.verifyData.person.address.where((element) => element.type==1).first.city.name+" - "),
                      BigText(text: controller.verifyData.person.address.where((element) => element.type==1).first.directory.name),
                      // BigText(text: controller.verifyData.provinceBirth[0].name),
                      // BigText(text: controller.verifyData.directorateBirth[0].name),
                    ],
                  ),
                  Row(
                    children: [
                      BigText(text: '  الجنس :',),
                      BigText(text: controller.verifyData.person.gender==1?'ذكر':'انثى'),
                    ],
                  ),
                  Row(
                    children: [
                      BigText(text: '  فصيلة الدم :',),
                      BigText(text: controller.verifyData.person.bloodType),

                    ],
                  ),
                  Row(
                    children: [
                      BigText(text: '  الحالة الأجتماعية :',),
                      BigText(text: controller.verifyData.person.maritalStatus),

                    ],
                  ),
                  Row(
                    children: [
                      BigText(text: '  الحالة التعليمية :',),
                      BigText(text: controller.verifyData.person.educationStatus),

                    ],
                  ),
                  Row(
                    children: [
                      BigText(text: '   الديانة :',),
                      BigText(text: controller.verifyData.person.religion),

                    ],
                  ),
                  Row(
                    children: [
                      BigText(text: '   مكان الاقامة :',),
                      BigText(text: controller.verifyData.person.address.where((element) => element.type==2).first.country.name+" - "),
                      BigText(text: controller.verifyData.person.address.where((element) => element.type==2).first.city.name+" - "),
                      BigText(text: controller.verifyData.person.address.where((element) => element.type==2).first.directory.name),

                    ],
                  ),
                  Row(
                    children: [
                      BigText(text: '   إسم أعلى شهاده  :',),
                      BigText(text: controller.verifyData.person.educationLevel),

                    ],
                  ),
                  Row(
                    children: [
                      BigText(text: '  التخصص  :',),
                      BigText(text: controller.verifyData.person.specilaization),

                    ],
                  ),
                  // Row(
                  //   children: [
                  //     // BigText(text: '  المهنة  :',),
                  //     // BigText(text: controller.verifyData.person.),
                  //
                  //   ],
                  // ),
                  const SizedBox(height: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(width: 10,),
                      Text(" صورة البطاقة الأمامية", style:
                      TextStyle(fontFamily: 'NotoKufiArabic', fontSize: 17,fontWeight: FontWeight.bold)),
                      // SizedBox(width: 20,),

                    ],
                  ),
                  InkWell(
                    onTap: () {
                      idCardController.showPickImageDialog(context);
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
                  SizedBox(height: 10,),
                  if (idCardController.imageFile != null)
                    Image.file(
                      idCardController.imageFile!,
                      height: 250,
                    ),
                  const SizedBox(height: 10,),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(width: 10,),
                      Text(" صورة البطاقة الخلفية", style:
                      TextStyle(fontFamily: 'NotoKufiArabic', fontSize: 17,fontWeight: FontWeight.bold)),
                      // SizedBox(width: 20,),

                    ],
                  ),
                  InkWell(
                    onTap: () {
                      idCardController.showPickImageDialog(context,file:1);
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
                      child: const Row(
                        children: [
                          SizedBox(width: 10,),
                          Icon(
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
                  if (idCardController.imageFile2 != null)
                    Image.file(
                      idCardController.imageFile2!,
                      height: 250,
                    ),




                  // Container(
                  //   margin: const EdgeInsets.symmetric(vertical: 5),
                  //   width: double.infinity,
                  //   // height: 50,
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //           child: CustomTextField(
                  //             context: context,
                  //             initialValue: 'كود التحقق ',
                  //             icon: Icons.person,
                  //             suffix: '',
                  //             showPassword: false,
                  //             isPassword: false,
                  //             inputType: TextInputType.number,
                  //             controller: controller.requestCode,
                  //           )),
                  //
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.9,
                    child: MaterialButton(onPressed: () {
                      // Get.to(stepTwoScreen());
                      // requestIdController.
print(idCardController.imageFile2?.path);
print(idCardController.imageFile?.length().toString());
                      controller.addVerifyWith2Image(controller.verifyData.barcode,idCardController.imageFile!.path,idCardController.imageFile2!.path);

                    }, child: const Text(" تأكيد", style: TextStyle(
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
