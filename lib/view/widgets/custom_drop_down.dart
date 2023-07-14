import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  final String? label;
  final String value;
  final bool showLabel;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const CustomDropdownButton({
    Key? key,
    this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    this.showLabel = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        showLabel == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      label!,
                      style: const TextStyle(
                        fontFamily: 'NotoKufiArabic',
                        fontSize: 15

                      ),
                    ),
                  ),
                ],
              )
            : Container(),
        // const SizedBox(height: 5,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
            color:  Colors.indigo.shade900.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
          ),
          child: DropdownButton(
            dropdownColor: Colors.white,
            iconDisabledColor: Colors.black,
            iconEnabledColor: Colors.black,
            style: const TextStyle(
              fontFamily: 'NotoKufiArabic',
              color: Colors.black,
              fontSize: 16.0,
            ),
            value: value,
            isExpanded: true,
            underline: const SizedBox(),
            items: items
                .map(
                  (item) => DropdownMenuItem(
                    alignment: Alignment.centerRight,
                    value: item,

                    child: Text(

                      item,
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                        fontFamily: 'NotoKufiArabic',
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
