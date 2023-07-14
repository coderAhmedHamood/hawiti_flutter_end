import 'package:flutter/material.dart';

import '../widgets/Drawer.dart';
import '../widgets/header_widget.dart';

class MyFamilyScreen extends StatelessWidget {
  const MyFamilyScreen({Key? key}) : super(key: key);

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
                        Icons.family_restroom_outlined,
                        size: 80,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'My Family',
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'NotoKufiArabic',
                          color: Colors.indigo.shade900,
                          fontWeight: FontWeight.bold),
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
