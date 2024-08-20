import 'package:get/get.dart';
import '../../../data/biodata_model.dart';

class BiodataController extends GetxController {
  // Menggunakan Rx untuk variabel yang reaktif
  final nama = ''.obs;
  final jenisKelamin = ''.obs;
  final agama = ''.obs;
  final tanggalLahir = DateTime.now().obs;
  final alamat = ''.obs;

  // Fungsi untuk mengubah nilai
  void setNama(String value) => nama.value = value;
  void setJenisKelamin(String? value) {
    if (value != null) jenisKelamin.value = value;
  }
  void setAgama(String? value) {
    if (value != null) agama.value = value;
  }
  void setTanggalLahir(DateTime value) => tanggalLahir.value = value;
  void setAlamat(String value) => alamat.value = value;

  // Fungsi untuk submit formulir
  void submitForm() {
    // Proses data formulir di sini atau navigasikan ke halaman Lain
    final formData = BiodataModel(
      nama: nama.value,
      jenisKelamin: jenisKelamin.value,
      agama: agama.value,
      tanggalLahir: tanggalLahir.value,
      alamat: alamat.value,
    );
    Get.toNamed('/output', arguments: formData);
  }
}