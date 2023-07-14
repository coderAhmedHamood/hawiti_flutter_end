import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../SharedPreferences.dart';
import '../../../controllers/auth_controller.dart';
import '../../widgets/CustomTextField.dart';
import '../../widgets/header_widget.dart';
import 'email_verification_screen.dart';

class loginScreen extends StatelessWidget {
  loginScreen({Key? key}) : super(key: key);
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('تسجيل الدخول'),
      // ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const SizedBox(
              height: 100,
              child: HeaderWidget(
                100,
                false,
                Icons.house_rounded,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Column(
                children: [
                  const SizedBox(height: 80.0),

                  Image.asset(
                    'assets/logo2.png',
                    width: 170,
                  ),
                  Text(
                    "هويتي",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'NotoKufiArabic',
                        color: Colors.indigo.shade900,
                        fontWeight: FontWeight.bold),
                  ),
                  // Container(
                  //
                  //   padding: const EdgeInsets.all(10),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(50),
                  //     border:
                  //     Border.all(width: 2, color: Colors.indigo.shade900),
                  //     color: Colors.indigo.shade900,
                  //
                  //   ),
                  //
                  //
                  // ),

                  const SizedBox(
                    height: 10,
                  ),

                  GetBuilder<AuthController>(builder: (logic) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          // Container(
                          //   alignment: Alignment.topRight,
                          //   child: Text(
                          //     'تسجيل الدخول',
                          //     style: TextStyle(
                          //       fontSize: 15,
                          //       fontFamily: 'NotoKufiArabic',
                          //       color: Colors.indigo.shade900,
                          //       fontWeight: FontWeight.bold
                          //     ),
                          //   ),
                          // ),
                          const SizedBox(height: 20),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextFormField(
                              cursorColor: Colors.indigo,
                              controller: authController.personIdCon,
                              textDirection: TextDirection.ltr,
                              decoration: InputDecoration(
                                labelText: 'الرقم الوطني',
                                labelStyle: TextStyle(
                                    fontFamily: 'NotoKufiArabic',
                                    color: Colors.indigo.shade900,
                                    fontSize: 15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.indigo.shade900,
                                    width: 2,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Colors.indigo.shade900,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                  horizontal: 16.0,
                                ),
                                filled: true,
                                fillColor:
                                    Colors.indigo.shade900.withOpacity(0.1),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.indigo,
                              controller: authController.emailCon,
                              textDirection: TextDirection.ltr,
                              decoration: InputDecoration(
                                labelText: 'البريد الالكتروني',
                                labelStyle: TextStyle(
                                    fontFamily: 'NotoKufiArabic',
                                    color: Colors.indigo.shade900,
                                    fontSize: 15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.indigo.shade900,
                                    width: 2,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.indigo.shade900,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                  horizontal: 16.0,
                                ),
                                filled: true,
                                fillColor:
                                    Colors.indigo.shade900.withOpacity(0.1),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),
                          GetBuilder<AuthController>(builder: (logic) {
                            return Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextFormField(
                                cursorColor: Colors.indigo,
                                controller: authController.passwordCon,
                                textDirection: TextDirection.ltr,
                                decoration: InputDecoration(
                                  labelText: 'كلمة المرور',
                                  labelStyle: TextStyle(
                                      fontFamily: 'NotoKufiArabic',
                                      color: Colors.indigo.shade900,
                                      fontSize: 15),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.indigo.shade900,
                                      width: 2,
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.indigo.shade900,
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      authController.togglePasswordVisibility();
                                    },
                                    child: Icon(
                                      authController.isPasswordHidden
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.indigo.shade900,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 16.0),
                                  filled: true,
                                  fillColor:
                                      Colors.indigo.shade900.withOpacity(0.1),
                                ),
                                obscureText: authController.isPasswordHidden,
                              ),
                            );
                          }),
                          const SizedBox(height: 20),

                          SizedBox(
                            height: 48.0,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (authController
                                    .personIdCon.text.isNotEmpty) {
                                  // حفظ القيمة المدخلة باستخدام SharedPreferences
                                  await SharedPreferencesHelper.setPersonId(
                                      authController.personIdCon.text);
                                   // انتقال إلى الشاشة التالية
                                }

                                authController.login();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => (VerificationEmailScreen())),
                                );
                              },
                              // بقية الخصائص للزر
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                primary: Colors.indigo.shade900,
                                onPrimary: Colors.white,
                                elevation: 2.0,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 60.0,
                                ),
                              ),
                              child: Text(
                                'دخول',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'NotoKufiArabic',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          VerificationEmailScreen()));
                            },
                            child: Text(
                              'هل نسيت كلمة المرور؟',
                              style: TextStyle(
                                color: Colors.indigo.shade900,
                                fontFamily: 'NotoKufiArabic',
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),

        // bottomNavigationBar: Container(
        //   height: 60,
        //   color: Colors.grey[200],
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Icon(
        //             Icons.facebook,
        //             color: Colors.indigo.shade900,
        //           ),
        //         ],
        //       ),
        //       const SizedBox(height: 8),
        //       Text(
        //         'Mustafa Alqershi 2023 | © جميع الحقوق محفوظة',
        //         style: TextStyle(
        //           fontFamily: 'NotoKufiArabic',
        //           fontSize: 10,
        //           color: Colors.indigo.shade900,
        //         ),
        //       ),
        //     ],
        //   ),
        //
      ),
    );
  }
}
