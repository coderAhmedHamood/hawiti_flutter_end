import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  String initialValue;
  IconData icon;
  String suffix;
  String? Function(String?)? validator;
  TextEditingController controller;
  bool isPassword;
  bool showPassword;
  bool? showIcon=false;
  TextInputType inputType;
  bool? froRegister=false;
  CustomTextField(
      {Key? key,
      required BuildContext context,
      required this.initialValue,
      required this.icon,
      required this.suffix,
      this.validator,
      this.showIcon,
      required this.showPassword,
      required this.controller,
      required this.isPassword,
        this.froRegister,
      required this.inputType})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding:  const EdgeInsets.symmetric(vertical:5.0,horizontal: 5),
      child: Directionality(
        textDirection: TextDirection.rtl,

        child: TextFormField(
          cursorColor: Colors.indigo.shade900,
          controller: widget.controller,
          style: const TextStyle(
            fontFamily: 'NotoKufiArabic',
            fontSize: 15
          ),
          textDirection: TextDirection.rtl,
          decoration:  InputDecoration(
errorStyle: const TextStyle(fontFamily: 'NotoKufiArabic'),
            labelText: widget.initialValue,
            labelStyle: const TextStyle(
              fontFamily: 'NotoKufiArabic',
              fontSize: 15,
              color: Colors.black
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          //   border:   Border.all(
          //   color: Colors.black,
          //   width: 1,
          // ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.indigo.shade900,
                width: 2,
              ),
            ),
            fillColor:  Colors.indigo.shade900.withOpacity(0.1),
            filled: true,
            enabledBorder: OutlineInputBorder(
                    borderSide:  BorderSide(color: Colors.indigo.shade900),
                    borderRadius: BorderRadius.circular(15),
                  ),
            // border:  const OutlineInputBorder(
            //   borderRadius: BorderRadius.all(
            //
            //
            //   Radius.circular(10),
            //
            //   ),
            //   borderSide: BorderSide(color: Colors.black,width: 2),
            // ),
            contentPadding:
            const EdgeInsetsDirectional.only(start: 12, end: 12),
            hintTextDirection: TextDirection.rtl,
          ),
          validator: widget.validator,

        ),
      ),
    );

    //   Padding(
    //   padding: const EdgeInsets.only(left: 8, right: 8, top: 1),
    //   child: TextFormField(
    //     controller: widget.controller,
    //     // cursorColor: Colors.black,
    //     textDirection: TextDirection.rtl,
    //     // textAlign: TextAlign.start,
    //     keyboardType: widget.inputType,
    //     style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black),
    //     // textAlign: TextAlign.right,
    //     // textDirection: TextDirection.rtl,
    //     maxLines: 1,
    //     obscureText:
    //         widget.isPassword == true ? widget.showPassword : widget.isPassword,
    //     // showPassword,
    //
    //     decoration: InputDecoration(
    //       floatingLabelBehavior: FloatingLabelBehavior.always,
    //       contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
    //       enabledBorder: OutlineInputBorder(
    //         borderSide: const BorderSide(color: Colors.black),
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //       errorBorder: OutlineInputBorder(
    //         borderSide: const BorderSide(color: Colors.red),
    //         borderRadius: BorderRadius.circular(10),
    //         // gapPadding: 10
    //       ),
    //       errorStyle: Theme.of(context)
    //           .textTheme
    //           .titleMedium
    //           ?.copyWith(color: Colors.red),
    //       iconColor: Colors.black,
    //       // suffixText: suffix,
    //       // prefixIcon:widget.showIcon==true? Icon(widget.icon):Container(),
    //       suffix: widget.isPassword == true
    //           ? Container(
    //               // alignment: Alignment.centerLeft,
    //               margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
    //               child: InkWell(
    //                   // padding: EdgeInsets.all(0),
    //                   onTap: () {
    //                     setState(() {
    //                       widget.showPassword = !widget.showPassword;
    //                     });
    //                   },
    //                   child: widget.showPassword == true
    //                       ? const Icon(
    //                           Icons.visibility,
    //                           size: 20,
    //                           color: Colors.black,
    //                         )
    //                       : const Icon(
    //                           Icons.visibility_off,
    //                           size: 20,
    //                           color: Colors.black,
    //                         )),
    //             )
    //           : Text(widget.suffix),
    //       // suffixIcon: Icon(widget.icon),
    //       suffixStyle: Theme.of(context).textTheme.titleMedium,
    //       // focusColor: Colors.white,
    //       focusedBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(10),
    //         borderSide: const BorderSide(color: Colors.indigo),
    //       ),
    //       border: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(10),
    //         borderSide: const BorderSide(color: Colors.black),
    //       ),
    //       labelText: widget.initialValue,
    //       // floatingLabelAlignment: FloatingLabelAlignment.start,
    //       // hintText: widget.initialValue,
    //       hintStyle:  Theme.of(context).textTheme.titleMedium?.copyWith(color:widget.froRegister==true?Colors.black:null),
    //       labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(color:widget.froRegister==true?Colors.black:null),
    //     ),
    //     validator: widget.validator,
    //   ),
    // );
  }
}
