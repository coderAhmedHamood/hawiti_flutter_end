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
import 'package:url_launcher/url_launcher.dart';

BirthController birthController = Get.put(BirthController());
IdCardController idcontroller = Get.find();

class requestBirthCardScreen extends StatelessWidget {
  requestBirthCardScreen({Key? key}) : super(key: key);
  Future<void> _launchInBrowser() async {
    final Uri url = Uri.parse('https://cra.gov.ye/index.php?sub=birth_new_inyemen');

    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IdCardController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "تقديم طلب شهادة ميلاد ",
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
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        width: double.infinity,
                        // height: 50,
                        child: Row(
                          children: [
                            Expanded(
                                child: CustomTextField(
                                  context: context,
                                  initialValue: '  اسم الطفل المولود ',
                                  icon: Icons.person,
                                  suffix: '',
                                  showPassword: false,
                                  isPassword: false,
                                  inputType: TextInputType.text,
                                  controller: birthController.nameCon,

                                )),

                          ],
                        ),

                      ),

                       Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 5,),
                          Text("بيانات  الميلاد",
                              style: TextStyle(fontFamily: 'NotoKufiArabic', fontSize: 18)),
                          SizedBox(width: 20,),

                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Container(
                          // height: 60,
                          width: double.infinity
                          ,child:  Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                                    items: controller.selectedCountryBirth
                                        .provinces
                                        .map((city) =>
                                        DropdownMenuItem<Provinces>(
                                          alignment: Alignment.centerRight,
                                          value: city,
                                          child: Text(city.name),
                                          onTap: () {
                                            // controller.selectedCityBirth=;
                                          },
                                        ))
                                        .toList(),
                                  ),
                                ),
                              ),
                              Expanded(child:   Container(
                                height: 50,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10),
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
                          ), ),
                          // const SizedBox(height: 10,),
                        ],
                      ),
                      //end cascading
                      // const SizedBox(height: 10,),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        width: double.infinity,
                        // height: 50,
                        child: Row(
                          children: [
                            Expanded(
                                child: CustomTextField(
                                  context: context,
                                  initialValue: '  قرية /عزلة ',
                                  icon: Icons.person,
                                  suffix: '',
                                  showPassword: false,
                                  isPassword: false,
                                  inputType: TextInputType.text,
                                  controller: birthController.villageBirthCon,
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
                                  initialValue: ' مكان الميلاد مستشفى / مركز صحي / المنزل ',
                                  icon: Icons.person,
                                  suffix: '',
                                  showPassword: false,
                                  isPassword: false,
                                  inputType: TextInputType.text,
                                  controller: birthController.birthPlaceCon,
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
                                  initialValue: ' صفة من قام بالتوليد قابلة / مركز صحي / آخر  ',
                                  icon: Icons.person,
                                  suffix: '',
                                  showPassword: false,
                                  isPassword: false,
                                  inputType: TextInputType.text,
                                  controller: birthController.birthByCon,
                                )),

                          ],
                        ),
                      ),
                      // const SizedBox(height: 10,),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        // padding: EdgeInsets.only(top: 5),
                        width: double.infinity,
                        // height: 50,
                        child:
                        Row(
                          children: [
                            Expanded(
                              child: CustomDropdownButton(label: 'الجنس',
                                value: birthController.genderCon.text,
                                items: ['ذكر', 'انثى'],
                                onChanged: (String? value) {
                                  birthController.genderCon.text = value!;
                                  controller.update();
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
                              child: CustomTextField(
                                context: context,
                                initialValue: 'الرقم الوطني للأب',
                                icon: Icons.person,
                                suffix: '',
                                showPassword: false,
                                isPassword: false,
                                inputType: TextInputType.text,
                                controller: birthController.fatherIdCon,

                              )),
                          Expanded(
                              child: CustomTextField(
                                context: context,
                                initialValue: 'الرقم الوطني  للأم',
                                icon: Icons.person,
                                suffix: '',
                                showPassword: false,
                                isPassword: false,
                                inputType: TextInputType.text,
                                controller: birthController.motherIdCon,

                              )),
                        ],
                      ),
                      ),

                      // const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: birthController.dobCon,
                          decoration: InputDecoration(
                            labelText: 'تاريخ الميلاد ',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 5.0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(10),
                              // gapPadding: 10
                            ),
                            errorStyle: Theme
                                .of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Colors.red),
                            iconColor: Colors.black,
                            suffixStyle: Theme
                                .of(context)
                                .textTheme
                                .titleMedium,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            labelStyle: const TextStyle(color: Colors.black),
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
                              birthController.dobCon.text =
                                  pickedDate.toString();
                              // DateFormat('yyyy-MM-dd').format(pickedDate);
                              // print(formattedDate); //formatted date output using intl package =>  2021-03-16
                              // setState(() {
                              //   dateInput.text =
                              // formattedDate; //set output date to TextField value.
                              // });
                            } else {}
                          },),
                      ),

                      // const SizedBox(height: 10,),
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
                                  icon: Icons.phone,
                                  suffix: '',
                                  showPassword: false,
                                  isPassword: false,
                                  inputType: TextInputType.phone,
                                  controller: birthController.phoneController,

                                )),

                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: double.infinity,
                        // height: 50,
                        child: Row(
                          children: [
                            Expanded(
                                child: CustomTextField(
                                  context: context,
                                  initialValue: '   رقم الدفتر العائلي للأسرة  ',
                                  icon: Icons.person,
                                  suffix: '',
                                  showPassword: false,
                                  isPassword: false,
                                  inputType: TextInputType.text,
                                  controller: birthController.familyCardNoCon,
                                )),

                          ],
                        ),
                      ),
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
                                value: idcontroller.selectedCityBranch,
                                onChanged: idcontroller.onCityBranchChanged,
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
                                items: idcontroller.selectedCountryBranch.provinces
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
                                value: idcontroller.selectedDirectoryBranch,
                                onChanged: idcontroller.onDirectoryBranchChanged,
                                items: idcontroller
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
                                value: idcontroller.selectedBranch,
                                onChanged: idcontroller.onBranchChanged,
                                items: idcontroller
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
                      SizedBox(height: 5),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        child: MaterialButton(
                          height: 50,
                          shape: BeveledRectangleBorder(
                              borderRadius:BorderRadius.all(Radius.circular(5))
                          ),
    onPressed: () {
    birthController.country=idcontroller.selectedCountryBirth.id;
    birthController.province=idcontroller.selectedCityBirth.id;
    birthController.directory=idcontroller.selectedDirectoryBirth.id;
    birthController.branch=idcontroller.selectedBranch.id;
    birthController.addNewBirthCard();},
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
