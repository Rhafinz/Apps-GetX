import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../utils/api.dart';

class RegisterController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isLoading = false.obs;

  Future<void> register() async {
    isLoading(true);
    final url = Uri.parse('${BaseUrl.api}/register');
    final response = await http.post(
      url,
      body: {
        'name': nameController.text,
        'email': emailController.text,
        'password': passwordController.text,
      },
    );

    if (response.statusCode == 201) {
      Get.snackbar(
        'Success',
        'Registration successful',
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.offAllNamed('/login');
    } else {
      Get.snackbar(
        'Error',
        'Registration failed. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    isLoading(false);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}