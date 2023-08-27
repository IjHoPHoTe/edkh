import 'package:dkh/src/router/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:http/http.dart' as http;

class AddKasPage extends StatefulWidget {
  @override
  _AddKasPageState createState() => _AddKasPageState();
}

class _AddKasPageState extends State<AddKasPage> {
  String? selectedJenis;
  String? selectedKegiatan;
  TextEditingController jumlahController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();

  List<String> jenisList = ['masuk', 'keluar'];
  List<String> kegiatanList = ['nks', 'ksb', 'lainnya'];

  @override
  void dispose() {
    jumlahController.dispose();
    keteranganController.dispose();
    super.dispose();
  }

  void postData() async {
    // var url = Uri.parse('http://dkhiass.gosir.my.id/api/post_kas');
    var url = Uri.parse('http://192.168.245.133:8001/api/post_kas');

    var response = await http.post(url, body: {
      'jenis': selectedJenis!,
      'kegiatan': selectedKegiatan!,
      'keterangan': keteranganController.text,
      'jumlah': jumlahController.text,
    });

    if (response.statusCode == 201) {
      print('Response body: ${response.body}');
      Get.toNamed(transaksiRoute);
    } else {
      print('gagal');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Kas'),
        backgroundColor: Color.fromRGBO(28, 151, 131, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, dashboardRoute);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: selectedJenis,
              onChanged: (value) {
                setState(() {
                  selectedJenis = value;
                });
              },
              items: jenisList.map((String jenis) {
                return DropdownMenuItem<String>(
                  value: jenis,
                  child: Text(jenis),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Jenis Kas',
              ),
            ),
            DropdownButtonFormField<String>(
              value: selectedKegiatan,
              onChanged: (value) {
                setState(() {
                  selectedKegiatan = value;
                });
              },
              items: kegiatanList.map((String kegiatan) {
                return DropdownMenuItem<String>(
                  value: kegiatan,
                  child: Text(kegiatan),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Kegiatan',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: jumlahController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Jumlah',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: keteranganController,
              decoration: InputDecoration(
                labelText: 'Keterangan',
              ),
            ),
            SizedBox(height: 80),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  postData();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(28, 151, 131, 1),
                  fixedSize: Size(450, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Simpan',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
