import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawiti/view/screens/identification_card_request/request_change_id_data.dart';
import 'package:hawiti/view/screens/identification_card_request/request_lost_id_screen.dart';
import 'package:hawiti/view/screens/identification_card_request/step_1_screen.dart';
class chooseOperationIdScreen extends StatelessWidget {
   chooseOperationIdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: double.infinity,height: 80,
            color: Colors.indigo.shade900,
          ),
          Row(
            children: [
              const SizedBox(width: 10,),
              Expanded(
                child: InkWell(
                  child: Card(
                    elevation: 20,
                    margin: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: (){
                        // setState(() {
                        //   if(type==1){
                            //  new id card
                            Get.to(stepOneScreen());
                          // }
                          // if(type==2){
                          //   // new birth card
                          // }
                          // isModeOperation=true;
                        // }

                      },

                      child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: Center(child: Text('جديد')),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: InkWell(
                  child: Card(
                    elevation: 20,
                    margin: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: (){
                          Get.to(requestIdLost());
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: Center(child: Text('بدلل  فاقد ')),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10,),

            ],
          ),
          Row(
            children: [
              const SizedBox(width: 10,),
              Expanded(child: Container()),
              const SizedBox(width: 10,),
              Expanded(
                child: InkWell(
                  child: Card(
                    elevation: 20,
                    margin: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: (){
                        // setState(() {
                        //   if(type==1){
                        //  new id card
                        Get.to(requestChangeIdDataScreen());
                        // }
                        // if(type==2){
                        //   // new birth card
                        // }
                        // isModeOperation=true;
                        // }

                      },

                      child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: Center(child: Text('طلب تغيير بيانات')),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 10,),

            ],
          ),


// InkWell(
//   onTap: ()async{
//       SimpleFontelicoProgressDialog _dialog = SimpleFontelicoProgressDialog(context: context);
//       // void showDialog() async{
//         _dialog.show(message: 'Loading...',type:SimpleFontelicoProgressDialogType.multiHurricane,horizontal: true);
//         await Future.delayed(const Duration(seconds: 10));
//         _dialog.hide();
//       // }
//   },
// ),
        ],
      ),
    );
  }
}
