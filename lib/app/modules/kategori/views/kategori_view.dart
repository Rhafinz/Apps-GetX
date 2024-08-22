import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/kategori_controller.dart';

class KategoriView extends GetView<KategoriController> {
  KategoriView({Key? key}) : super(key: key);
  final KategoriController controller = Get.put(KategoriController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kategori',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white, size: 28),
            onPressed: () => Get.toNamed('/kategori/create'),
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
          itemCount: controller.kategoriList.length,
          itemBuilder: (context, index) {
            final item = controller.kategoriList[index];
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
                  item.namaKategori ?? 'No Name',
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
                          Get.toNamed('/kategori/edit', arguments: item),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => controller.deleteKategori(item.id!),
                    ),
                  ],
                ),
                onTap: () => Get.toNamed('/kategori/show', arguments: item),
              ),
            );
          },
        );
      }),
    );
  }
}