import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../utils/api.dart';

class ProfileController extends GetxController {
  final box = GetStorage();
  var userProfile = {}.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  void logout() {
    box.remove('access_token');
    Get.offAllNamed('/login');
  }

  Future<void> fetchUserProfile() async {
    isLoading(true);
    final token = box.read('access_token');
    final url = Uri.parse('${BaseUrl.api}/user/profile');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      userProfile.value = json.decode(response.body);
    } else {
      Get.snackbar('Error', 'Failed to load profile',
          snackPosition: SnackPosition.BOTTOM);
    }
    isLoading(false);
  }
}