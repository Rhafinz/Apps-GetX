import 'package:get/get.dart';

import '../controllers/bottom_menu_controller.dart';

class BottomMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomMenuController>(
      () => BottomMenuController(),
    );
  }
}
