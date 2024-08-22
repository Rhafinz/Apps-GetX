import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/kategori_model.dart';

class ShowKategoriView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Data kategori = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kategori',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Colors.deepPurple[50],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nama Kategori: ${kategori.namaKategori}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Slug: ${kategori.slug}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.deepPurple[700],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Created At: ${kategori.createdAt}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.deepPurple[700],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Updated At: ${kategori.updatedAt}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.deepPurple[700],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}