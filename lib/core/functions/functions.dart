import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showError(String message) {
  // var error = jsonDecode(responseBody)['error'];
  // var errorMessage = '';
  // error.forEach((key, value) {
  //   errorMessage += '$key: ${value[0]}\n';
  // });
  Get.snackbar(
    'Error',
    message,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.red,
    colorText: Colors.white,
  );
}
void showSuccessSnack(String message) {
  // var error = jsonDecode(responseBody)['error'];
  // var errorMessage = '';
  // error.forEach((key, value) {
  //   errorMessage += '$key: ${value[0]}\n';
  // });
  Get.snackbar(
    'Success',
    message,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.green,
    colorText: Colors.white,
  );
}

Future<bool> checkInternetConnection() async {
  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
  return false;
}

String getErrorMessage(dynamic errorResponse) {
  final errors = errorResponse['errors'] as Map<String, dynamic>;

  if (errors != null && errors.isNotEmpty) {
    final firstError = errors.entries.first;
    final fieldName = firstError.key;
    final errorMessage = firstError.value.toString();

    switch (fieldName) {
      case 'person_id':
        return 'حقل معرّف الشخص مطلوب';
    // add more cases for other field names as needed
      default:
        return errorMessage;
    }
  } else {
    return 'حدث خطأ غير معروف';
  }
}

