import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthMiddleware extends GetMiddleware {
  final box = GetStorage();

  @override
  RouteSettings? redirect(String? route) {
    final token = box.read('access_token');
    if (token == null && route != '/login' && route != '/register') {
      return const RouteSettings(name: '/login');
    }
    return null;
    
  }
}
