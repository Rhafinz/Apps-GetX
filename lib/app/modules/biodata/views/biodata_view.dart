import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/biodata_controller.dart';

class BiodataView extends GetView<BiodataController> {
  const BiodataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulir Biodata'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Silakan isi Biodata di bawah ini:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade700,
                ),
              ),
              SizedBox(height: 16),
              TextField(
                onChanged: controller.setNama,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Jenis Kelamin',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade600,
                ),
              ),
              Row(
                children: [
                  Obx(() => Expanded(
                    child: ListTile(
                      title: const Text('Laki-laki'),
                      leading: Radio<String>(
                        value: 'Laki-laki',
                        groupValue: controller.jenisKelamin.value,
                        onChanged: controller.setJenisKelamin,
                        activeColor: Colors.teal,
                      ),
                    ),
                  )),
                  Obx(() => Expanded(
                    child: ListTile(
                      title: const Text('Perempuan'),
                      leading: Radio<String>(
                        value: 'Perempuan',
                        groupValue: controller.jenisKelamin.value,
                        onChanged: controller.setJenisKelamin,
                        activeColor: Colors.teal,
                      ),
                    ),
                  )),
                ],
              ),
              SizedBox(height: 16),
              Obx(
                () => DropdownButtonFormField<String>(
                  value: controller.agama.value.isEmpty
                      ? null
                      : controller.agama.value,
                  items: <String>['Islam', 'Kristen', 'Hindu', 'Budha']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: controller.setAgama,
                  decoration: InputDecoration(
                    labelText: 'Pilih Agama',
                    prefixIcon: Icon(Icons.accessibility),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Obx(
                () => TextField(
                  decoration: InputDecoration(
                    labelText: 'Tanggal Lahir',
                    hintText: 'Pilih Tanggal Lahir',
                    prefixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: controller.tanggalLahir.value,
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      controller.setTanggalLahir(pickedDate);
                    }
                  },
                  controller: TextEditingController(
                    text: controller.tanggalLahir.value
                        .toString()
                        .split('')[0],
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                onChanged: controller.setAlamat,
                decoration: InputDecoration(
                  labelText: 'Alamat',
                  prefixIcon: Icon(Icons.home),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: controller.submitForm,
                  icon: Icon(Icons.send),
                  label: const Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.teal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}