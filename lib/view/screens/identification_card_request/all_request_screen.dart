import 'package:flutter/material.dart';

import '../../../model/all_requests.dart';

class AllRequestScreen extends StatelessWidget {
  AllRequestData allRequestData;

  AllRequestScreen({super.key, required this.allRequestData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                'طلبات البطاقة الشخصية :',
                style: TextStyle(
                  fontFamily: 'NotoKufiArabic',
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              Row(
                children: [
                  const Text(
                    'تاريخ الطلب :',
                    style: TextStyle(
                      fontFamily: 'NotoKufiArabic',
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(allRequestData.id.requestDate,style: const TextStyle(
                    fontFamily: 'NotoKufiArabic',
                    color: Colors.black,
                    fontSize: 16.0,
                  ),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
