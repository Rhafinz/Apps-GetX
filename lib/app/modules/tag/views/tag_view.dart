import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/tag_controller.dart';

class TagView extends GetView<TagController> {
  TagView({Key? key}) : super(key: key);
  final TagController controller = Get.put(TagController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tag',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white, size: 28),
            onPressed: () => Get.toNamed('/tag/create'),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.deepPurple,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: controller.tagList.length,
          itemBuilder: (context, index) {
            final item = controller.tagList[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              shadowColor: Colors.deepPurple.withOpacity(0.5),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
                title: Text(
                  item.namaTag ?? 'No Name',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                subtitle: Text(
                  item.slug ?? '',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.deepPurple),
                      onPressed: () =>
                          Get.toNamed('/tag/edit', arguments: item),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => controller.deleteTag(item.id!),
                    ),
                  ],
                ),
                onTap: () => Get.toNamed('/tag/show', arguments: item),
              ),
            );
          },
        );
      }),
    );
  }
}