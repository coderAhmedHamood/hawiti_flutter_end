// import 'package:clothes/controllers/RequestIdController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/id_card_controller.dart';
import '../widgets/CustomTextField.dart';
import '../widgets/cascade_dropdown.dart';
import '../widgets/custom_drop_down.dart';

// import '../widgets/custom_text_field.dart';

class addRequestIdCard extends StatelessWidget {
  addRequestIdCard({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  IdCardController requestIdController=Get.put(IdCardController());
  String value='صنعاء';
  String nationality='يمني ';
  String  blood='O+';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "تقديم طلب بطاقة شخصية ",
            style: TextStyle(fontFamily: 'Cairo'),
          ),
        ),
        body:
           Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  // padding: EdgeInsets.only(top: 5),
                  width: double.infinity,
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(
                          child:
                  Column(
                    children: [
                      const Expanded(child: Text('المحافظه ',)),
                      DropdownButton(
                      value: value,
                          items: const [
                            DropdownMenuItem(
                              child: Text("صنعاء"),
                              value: 'صنعاء',
                            ),
                            DropdownMenuItem(
                              child: Text("Second Item"),
                              value: 2,
                            ),
                            DropdownMenuItem(
                                child: Text("Third Item"),
                                value: 3
                            ),
                            DropdownMenuItem(
                                child: Text("Fourth Item"),
                                value: 4
                            )
                          ],
                          onChanged: (value) {
                            // setState(() {
                            //   _value = value;
                            }),
                    ],
                  ),
                      ),
                      Expanded(
                          child:  Column(
                            children: [
                              const Expanded(child: Text('المديرية   ',)),
                              DropdownButton(
                                  value: value,
                                  items: const [
                                    DropdownMenuItem(
                                      child: Text("صنعاء"),
                                      value: 'صنعاء',
                                    ),
                                    DropdownMenuItem(
                                      child: Text("Second Item"),
                                      value: 2,
                                    ),
                                    DropdownMenuItem(
                                        child: Text("Third Item"),
                                        value: 3
                                    ),
                                    DropdownMenuItem(
                                        child: Text("Fourth Item"),
                                        value: 4
                                    )
                                  ],
                                  onChanged: (value) {
                                    // setState(() {
                                    //   _value = value;
                                  }),
                            ],
                          ),),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                          child: CustomTextField(
                            context: context,
                            initialValue: ' الاسم ',
                            icon: Icons.message,
                            suffix: '',
                            showPassword: false,
                            isPassword: false,
                            inputType: TextInputType.text,
                            controller: nameController,

                          )),
                      Expanded(
                          child: CustomTextField(
                            context: context,
                            initialValue: 'اسم الأب  ',
                            icon: Icons.message,
                            suffix: '',
                            showPassword: false,
                            isPassword: false,
                            inputType: TextInputType.text,
                            controller: nameController,
                          )),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                          child: CustomTextField(
                            context: context,
                            initialValue: ' اسم الجد ',
                            icon: Icons.message,
                            suffix: '',
                            showPassword: false,
                            isPassword: false,
                            inputType: TextInputType.text,
                            controller:nameController,
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
                            controller: nameController,
                          )),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  // padding: EdgeInsets.only(top: 5),
                  width: double.infinity,
                  // height: 80,
                  child: Row(
                    children: [
                      Expanded(
                        child:  CustomDropdownButton(label: 'فصيلة الدم', value: 'o+', items: ['o+'], onChanged: (String? value) {  },
                        ),

                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                          child: CustomTextField(
                            context: context,
                            initialValue: ' اسم الجد ',
                            icon: Icons.message,
                            suffix: '',
                            showPassword: false,
                            isPassword: false,
                            inputType: TextInputType.text,
                            controller:nameController,
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
                            controller: nameController,
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.8,
                  child: MaterialButton(onPressed: () {}, child: const Text("حفظ"),
                    color: Colors.green,),
                ),
                // CascadingDropdowns(),
              ],
            ),
          ),
        );
  }
}
