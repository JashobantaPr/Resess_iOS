import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CreatePasswordController extends GetxController {
  TextEditingController txtPwdController = TextEditingController();
  RxBool isObscure = true.obs;

  var validationMessage = ''.obs;

  void setValidationMessage(String message) {
    validationMessage.value = message;
  }

  void clearValidationMessage() {
    validationMessage.value = '';
  }

  var isCreatePassword = true.obs;

  void validateEmail() {
    isCreatePassword.value = GetUtils.isEmail(txtPwdController.text.trim());
  }

  var errorMessage = ''.obs;

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
