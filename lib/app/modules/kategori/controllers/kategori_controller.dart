import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:myapp/app/data/kategori_model.dart';
import 'package:myapp/app/utils/api.dart';

class KategoriController extends GetxController {
  var kategoriList = <Data>[].obs;
  var isLoading = true.obs;

  final String baseUrl = '${BaseUrl.api}/kategori';

  @override
  void onInit() {
    fetchKategories();
    super.onInit();
  }

  // Fetch Kategori
  void fetchKategories() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var kategori = Kategori.fromJson(jsonResponse);
        kategoriList.value = kategori.data!;
      } else {
        Get.snackbar('Error', 'Failed to load Kategori');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load Kategori: $e');
    } finally {
      isLoading(false);
    }
  }

  // Add Kategori
  Future<void> addKategori(Data newKategori) async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(newKategori.toJson()),
      );
      if (response.statusCode == 201) {
        fetchKategories();
        Get.back();
        Get.snackbar('Success', 'Kategori added successfully');
      } else {
        Get.snackbar('Error', 'Failed to add Kategori');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to add Kategori: $e');
    } finally {
      isLoading(false);
    }
  }

  // Update Kategori
  Future<void> updateKategori(int id, Data updatedKategori) async {
    try {
      isLoading(true);
      final response = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(updatedKategori.toJson()),
      );
      if (response.statusCode == 200) {
        fetchKategories();
        Get.back();
        Get.snackbar('Success', 'Kategori updated successfully');
      } else {
        Get.snackbar('Error', 'Failed to update Kategori');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update Kategori: $e');
    } finally {
      isLoading(false);
    }
  }

  // Delete Kategori
  Future<void> deleteKategori(int id) async {
    try {
    isLoading(true);
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      fetchKategories();
      Get.snackbar('Success', 'Kategori deleted successfully');
    } else {
      Get.snackbar('Error', 'Failed to delete Kategori');
    }
  } catch (e) {
    Get.snackbar('Error', 'Failed to delete Kategori: $e');
  } finally {
    isLoading(false);
    }
  }
}
