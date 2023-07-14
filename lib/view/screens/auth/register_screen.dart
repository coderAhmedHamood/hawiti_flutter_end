import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../../widgets/CustomTextField.dart';
class registerScreen extends StatelessWidget {
   registerScreen({Key? key}) : super(key: key);
AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تسجيل الدخول'),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              width: double.infinity,
              height: 50,
              child: Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                        context: context,
                        initialValue: '  الاسم ',
                        icon: Icons.person,
                        suffix: '',
                        showPassword: false,
                        isPassword: false,
                        inputType: TextInputType.text,
                        controller: authController.nameCon,

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
                        initialValue: '  البريد ',
                        icon: Icons.person,
                        suffix: '',
                        showPassword: false,
                        isPassword: false,
                        inputType: TextInputType.emailAddress,
                        controller: authController.emailCon,

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
                        initialValue: '  كلمة السر ',
                        icon: Icons.person,
                        suffix: '',
                        showPassword: false,
                        isPassword: true,
                        inputType: TextInputType.visiblePassword,
                        controller: authController.passwordCon,

                      )),

                ],
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.symmetric(vertical: 5),
            //   width: double.infinity,
            //   height: 50,
            //   child: Row(
            //     children: [
            //       Expanded(
            //           child: CustomTextField(
            //             context: context,
            //             initialValue: '  تأكيد كلمة السر ',
            //             icon: Icons.person,
            //             suffix: '',
            //             showPassword: false,
            //             isPassword: true,
            //             inputType: TextInputType.visiblePassword,
            //             controller: authController.confirmPasswordCon,
            //
            //           )),
            //
            //     ],
            //   ),
            // ),
            //signup button
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              width: double.infinity,
              height: 50,
              child: Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          authController.register();
                        },
                        child: const Text('تسجيل'),
                      )),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
