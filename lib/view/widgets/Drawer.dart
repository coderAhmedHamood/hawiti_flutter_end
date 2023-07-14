import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hawiti/view/screens/read_qr.dart';

import '../../SharedPreferences.dart';
import '../screens/auth/login_screen.dart';
import '../screens/birth/request_birth_card_screen.dart';
import '../screens/birth/request_lost_birth_card_screen.dart';
import '../screens/death_request/death_request_screen.dart';
import '../screens/family/request_family_card.dart';
import '../screens/family/request_lost_family_card.dart';
import '../screens/family/request_renew_family_card.dart';
import '../screens/identification_card_request/renew_id_screen.dart';
import '../screens/identification_card_request/request_change_id_data.dart';
import '../screens/identification_card_request/request_lost_id_screen.dart';
import '../screens/identification_card_request/step_1_screen.dart';
import '../screens/identification_card_request/update_step_1_screen.dart';
import '../screens/identification_card_request/verification_request_screen.dart';
import '../screens/my_family_screen.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.indigo.shade900,
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.account_circle,
                      color: Colors.indigo.shade900, size: 80),
                ),
              ),
              // Visibility(
              //   visible: SharedPreferencesHelper.getPersonId() != null, // hide when getPersonId() returns null
              ListTile(
                title: const Text(
                  'تقديم ',
                  style: TextStyle(
                    fontFamily: 'NotoKufiArabic',
                  ),
                ),
                // enabled:false,
                // enabled: SharedPreferencesHelper.getPersonId() == null,
                onTap: () {
                  Get.to(ReadQR());
                },
              ),
              ExpansionTile(
                leading: const Icon(Icons.person), //add icon

                title: const Text(
                  "طلب بطاقة شخصية",
                  style: TextStyle(
                    fontFamily: 'NotoKufiArabic',
                  ),
                ),
                childrenPadding:
                    const EdgeInsets.only(left: 30), //children padding

                children: [
                  ListTile(
                    title: const Text(
                      'جديد',
                      style: TextStyle(
                        fontFamily: 'NotoKufiArabic',
                      ),
                    ),
                    // enabled:false,
                    // enabled: SharedPreferencesHelper.getPersonId() == null,
                    onTap: () {
                      Get.to(stepOneScreen());
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text(
                      "بدل فاقد",
                      style: TextStyle(
                        fontFamily: 'NotoKufiArabic',
                      ),
                    ),
                    enabled: true,
                    onTap: ()  {

                       Get.to(requestIdLost());
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text(
                      "تجديد منتهية",
                      style: TextStyle(
                        fontFamily: 'NotoKufiArabic',
                      ),
                    ),
                    onTap: () {


                      Get.to(requestRenewIdScreen());
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text(
                      "تغيير بيانات  ",
                      style: TextStyle(
                        fontFamily: 'NotoKufiArabic',
                      ),
                    ),
                    onTap: () {
                      Get.to(requestChangeIdDataScreen());
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text(
                      "تعديل البيانات  ",
                      style: TextStyle(
                        fontFamily: 'NotoKufiArabic',
                      ),
                    ),
                    onTap: () {
                      Get.to((updatestepOneScreen()));
                    },
                  ),
                ],
              ),

              const Divider(
                color: Colors.black,
              ),

              ExpansionTile(
                title: const Text(
                  "طلب بطاقة عائلية",
                  style: TextStyle(
                    fontFamily: 'NotoKufiArabic',
                  ),
                ),
                leading: const Icon(Icons.person), //add icon
                childrenPadding:
                    const EdgeInsets.only(left: 60), //children padding
                //  // disable when getPersonId() returns null
                //  enabled

                children: [
                  ListTile(
                    title: const Text(
                      "جديد",
                      style: TextStyle(
                        fontFamily: 'NotoKufiArabic',
                      ),
                    ),
                    onTap: () {
                      Get.to(RequestFamilyCardScreen());
                      //action on press
                    },
                  ),
                  ListTile(
                    title: const Text(
                      "بدل فاقد",
                      style: TextStyle(
                        fontFamily: 'NotoKufiArabic',
                      ),
                    ),
                    onTap: () {
                      //action on press
                      Get.to(RequestLostFamilyCardScreen());
                    },
                  ),
                  ListTile(
                    title: const Text(
                      "تجديد منتهية",
                      style: TextStyle(
                        fontFamily: 'NotoKufiArabic',
                      ),
                    ),
                    onTap: () {
                      Get.to(RequestRenewFamilyCardScreen());
                    },
                  ),
                  ListTile(
                    title: const Text(
                      " عائلتي",
                      style: TextStyle(
                        fontFamily: 'NotoKufiArabic',
                      ),
                    ),
                    onTap: () {
                      Get.to(const MyFamilyScreen());
                    },
                  ),

                  //more child menu
                ],
              ),

              const Divider(
                color: Colors.black,
              ),
              ExpansionTile(
                title: const Text(
                  "طلب شهادة ميلاد",
                  style: TextStyle(
                    fontFamily: 'NotoKufiArabic',
                  ),
                ),
                leading: const Icon(Icons.person), //add icon
                childrenPadding:
                    const EdgeInsets.only(left: 60), //children padding
                children: [
                  ListTile(
                    title: const Text(
                      "جديد",
                      style: TextStyle(
                        fontFamily: 'NotoKufiArabic',
                      ),
                    ),
                    onTap: () {
                      Get.to(requestBirthCardScreen());
                    },
                  ),

                  ListTile(
                    title: const Text(
                      "بدل فاقد",
                      style: TextStyle(
                        fontFamily: 'NotoKufiArabic',
                      ),
                    ),
                    onTap: () {
                      Get.to(requestLostBirthCardScreen());
                    },
                  ),
                  ListTile(
                    title: const Text(
                      "تجديد منتهية",
                      style: TextStyle(
                        fontFamily: 'NotoKufiArabic',
                      ),
                    ),
                    onTap: () {
                      //action on press
                    },
                  ),

                  //more child menu
                ],
              ),
              const Divider(
                color: Colors.black,
              ),
              ExpansionTile(
                title: const Text(
                  "طلب شهادة وفاه",
                  style: TextStyle(
                    fontFamily: 'NotoKufiArabic',
                  ),
                ),
                leading: const Icon(Icons.person), //add icon
                childrenPadding:
                    const EdgeInsets.only(left: 60), //children padding
                children: [
                  ListTile(
                    title: const Text(
                      "جديد",
                      style: TextStyle(
                        fontFamily: 'NotoKufiArabic',
                      ),
                    ),
                    onTap: () {
                      Get.to(requestDeathScreen());
                    },
                  ),

                  ListTile(
                    title: const Text(
                      "بدل فاقد",
                      style: TextStyle(
                        fontFamily: 'NotoKufiArabic',
                      ),
                    ),
                    onTap: () {
                      //action on press
                    },
                  ),

                  //more child menu
                ],
              ),
            ],
          )),
    );
  }


}
