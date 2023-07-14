import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawiti/controllers/id_card_controller.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../widgets/Drawer.dart';
import '../widgets/header_widget.dart';
class MyServiceScreen extends StatelessWidget {
  const MyServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // appBar: AppBar(
        //     backgroundColor: Colors.indigo.shade900,
        //     automaticallyImplyLeading: false),
        // endDrawer: MyDrawer(),
        body: SingleChildScrollView(
          child: Stack(children: [
            const SizedBox(
              height: 100,
              child: HeaderWidget(100, false, Icons.house_rounded),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Column(
                children: [
                  Column(children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                            width: 0.4, color: Colors.indigo.shade900),
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
                        Icons.note_add_sharp,
                        size: 80,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'بياناتي ',
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'NotoKufiArabic',
                          color: Colors.indigo.shade900,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 160,
                      child: Card(
                        elevation: 20,
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                 Expanded(
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text('الاسم',
                                      style: TextStyle(
                                        fontFamily: 'NotoKufiArabic',
                                      ),),
                                      Text('الرقم الوطني ',
                                        style: TextStyle(
                                          fontFamily: 'NotoKufiArabic',
                                        ),),
                                      Text('عرض الملف الشخصي',
                                        style: TextStyle(
                                          fontFamily: 'NotoKufiArabic',

                                        ),),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.indigo.shade900,
                                  ),
                                ),
                                const SizedBox(width: 10,),

                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text('الهوية الرقمية',
                                  style: TextStyle(
                                    fontFamily: 'NotoKufiArabic',
                                  ),),
                                const SizedBox(width: 10,),
                                Container(width: 40,height: 40,decoration: const BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  // color: Colors.indigo.shade900,
                                ),
                                  child: const Icon(Icons.qr_code_scanner_outlined,size: 40,),),
                                const SizedBox(width: 20,),
                              ],
                            ),
                          ],
                        ),
                      ),

                    ),
                    const SizedBox(height: 15,),
                    InkWell(
                      onTap: (){
                        // Get.to();
                        Get.find<IdCardController>().getAllRequests();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text('طلباتي',
                            style: TextStyle(
                              fontFamily: 'NotoKufiArabic',
                              fontSize: 14,
                            ),),
                          const SizedBox(width: 10,),
                          Container(width: 40,height: 40,decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            // color: Colors.indigo.shade900,
                          ),
                            child: const Icon(Icons.list_outlined,size: 40,),),
                          const SizedBox(width: 20,),
                        ],
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

}
