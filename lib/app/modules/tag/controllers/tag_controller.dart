import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../data/tag_model.dart';
import '../../../utils/api.dart';

class TagController extends GetxController {
  var tagList = <DataTag>[].obs;
  var isLoading = true.obs;

  final String baseUrl = '${BaseUrl.api}/tag';

  @override
  void onInit() {
    fetchTags();
    super.onInit();
  }

  // Fetch Tag
  void fetchTags() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var tag = Tag.fromJson(jsonResponse);
        tagList.value = tag.data!;
      } else {
        Get.snackbar('Error', 'Failed to load Tag');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load Tag: $e');
    } finally {
      isLoading(false);
    }
  }

  // Add Tag
  Future<void> addTag(DataTag newTag) async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(newTag.toJson()),
      );
      if (response.statusCode == 201) {
        fetchTags();
        Get.back();
        Get.snackbar('Success', 'Tag added successfully');
      } else {
        Get.snackbar('Error', 'Failed to add Tag');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to add Tag: $e');
    } finally {
      isLoading(false);
    }
  }

  // Update Tag
  Future<void> updateTag(int id, DataTag updatedTag) async {
    try {
      isLoading(true);
      final response = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(updatedTag.toJson()),
      );
      if (response.statusCode == 200) {
        fetchTags();
        Get.back();
        Get.snackbar('Success', 'Tag updated successfully');
      } else {
        Get.snackbar('Error', 'Failed to update Tag');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update Tag: $e');
    } finally {
      isLoading(false);
    }
  }

  // Delete Tag
  Future<void> deleteTag(int id) async {
    try {
      isLoading(true);
      final response = await http.delete(Uri.parse('$baseUrl/$id'));
      if (response.statusCode == 200) {
        fetchTags();
        Get.snackbar('Success', 'Tag deleted successfully');
      } else {
        Get.snackbar('Error', 'Failed to delete Tag');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete Tag: $e');
    } finally {
      isLoading(false);
    }
  }
}
