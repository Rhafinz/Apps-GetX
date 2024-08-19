import 'package:get/get.dart';

class CounterController extends GetxController {
  final bilangan = 0.obs;

  void increment() {
    if (bilangan.value >= 20) {
      Get.snackbar('Warning', 'Tos Jang Loba Teuing');
    } else {
      bilangan.value++;
    }
  }
  void decrement() {
    if (bilangan.value <= 0) {
      Get.snackbar('Warning', 'Tos Jang Seep Hayoh We DiPencet');
    } else {
      bilangan.value--;
    }
  }
}
