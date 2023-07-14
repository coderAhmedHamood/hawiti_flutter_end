import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawiti/view/screens/identification_card_request/show_verification_data.dart';
import '../../../SharedPreferences.dart';
import '../../../controllers/auth_controller.dart';
import '../../../controllers/id_card_controller.dart';
import '../../../controllers/verify_controller.dart';
import '../../widgets/CustomTextField.dart';
import '../../widgets/header_widget.dart';
import '../home/HomeNavBar.dart';
import '../home/home_contnet.dart';
import '../home/home_screen.dart';

class VerificationEmailScreen extends StatelessWidget {
  VerificationEmailScreen({Key? key}) : super(key: key);
  VerifyController controller = Get.put(VerifyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border:
                          Border.all(width: 2, color: Colors.indigo.shade900),
                      color: Colors.indigo.shade900,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.verified,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "التحقق من البريد الالكتروني",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'NotoKufiArabic',
                        color: Colors.indigo.shade900,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30.0),
                  GetBuilder<AuthController>(builder: (logic) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            "تم ارسال كود التحقق الى بريدك",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'NotoKufiArabic',
                              color: Colors.indigo.shade900,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextFormField(
                              cursorColor: Colors.indigo,
                              controller: controller.personId,
                              textDirection: TextDirection.ltr,
                              decoration: InputDecoration(
                                labelText: 'كود التحقق',
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
                                  Icons.outgoing_mail,
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
                          SizedBox(
                            height: 48.0,
                            child: ElevatedButton(
                              onPressed: () async {


                                Get.to(HomeNavBar());

                              },


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
                              child: const Text(
                                'تحقق',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'NotoKufiArabic',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          TextButton(
                            onPressed: () async {


                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          VerificationEmailScreen()));
                            },
                            child: Text(
                              'اعادة ارسال كود التحقق ؟',
                              style: TextStyle(
                                color: Colors.indigo.shade900,
                                fontFamily: 'NotoKufiArabic',
                              ),
                            ),
                          ),
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
