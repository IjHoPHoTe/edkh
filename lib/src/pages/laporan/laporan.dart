import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:dkh/src/router/constant.dart';
import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart'; // Import library open_file
import 'package:path_provider/path_provider.dart';

class LaporanPage extends StatefulWidget {
  @override
  _LaporanPageState createState() => _LaporanPageState();
}

class _LaporanPageState extends State<LaporanPage> {
  DateTime tanggalAwal = DateTime.now();
  DateTime tanggalAkhir = DateTime.now();

  Future<List<dynamic>> fetchDataFromApi() async {
    // final apiUrl = 'http://dkhiass.gosir.my.id/api/semua_kas';
    final apiUrl = 'http://192.168.185.133:8001/semua_kas';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        // Berhasil mendapatkan data dari API
        final decodedData = json.decode(response.body);
        final List<dynamic> dataList = decodedData['data'];
        return dataList;
      } else {
        // Jika request gagal, kembalikan list kosong atau berikan penanganan kesalahan sesuai kebutuhan Anda.
        return [];
      }
    } catch (e) {
      // Tangani kesalahan ketika terjadi error saat mengambil data dari API.
      print('Error: $e');
      // Kembalikan list kosong atau berikan penanganan kesalahan sesuai kebutuhan Anda.
      return [];
    }
  }

  List<DataRow> getRows(List<dynamic> data) {
    List<DataRow> rows = [];

    for (var transaction in data) {
      String jenis = transaction['jenis'];
      String kegiatan = transaction['kegiatan'];
      String keterangan = transaction['keterangan'];
      String createdAt = formatHari(transaction['created_at']);
      String jumlah = NumberFormat.currency(
        locale: 'id_ID',
        symbol: '',
        decimalDigits: 0,
      ).format(int.parse(transaction['jumlah']));

      rows.add(
        DataRow(
          cells: [
            DataCell(Text(jenis)),
            DataCell(Text(kegiatan)),
            DataCell(Text(keterangan)),
            DataCell(Text(createdAt)),
            DataCell(
              Text(
                'Rp. $jumlah',
                style: TextStyle(
                  color: jenis == 'masuk'
                      ? Colors.green
                      : (jenis == 'keluar' ? Colors.red : Colors.black),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            DataCell(
              IconButton(
                icon: Icon(Icons.info),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        DetailTransaksiPage(transaction: transaction),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }

    return rows;
  }

  String formatHari(String inputDate) {
    final DateTime date = DateTime.parse(inputDate);
    final DateFormat formatter = DateFormat('EEEE, dd MMMM yyyy', 'id_ID');
    final String formattedHari = formatter.format(date);
    return formattedHari;
  }

  void _showDatePicker(BuildContext context, bool isAwal) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isAwal ? tanggalAwal : tanggalAkhir,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != (isAwal ? tanggalAwal : tanggalAkhir)) {
      setState(() {
        if (isAwal) {
          tanggalAwal = picked;
        } else {
          tanggalAkhir = picked;
        }
      });
    }
  }

  void _simpanDataExcel(List<dynamic> data) async {
    var excel = Excel.createExcel();
    var sheet = excel['Sheet1'];

    // Kode lainnya sama seperti sebelumnya

    // Simpan file Excel dengan nama 'laporan.xlsx' ke dalam penyimpanan perangkat
    List<int>? fileBytes;
    if (Platform.isAndroid || Platform.isIOS) {
      fileBytes = excel.save();
    } else if (kIsWeb) {
      fileBytes = excel.encode();
    } else {
      throw UnsupportedError("Platform not supported.");
    }

    if (fileBytes != null) {
      Directory? directory;
      if (Platform.isAndroid || Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      }

      String path = directory?.path ?? '';

      // Simpan file Excel dengan nama 'laporan.xlsx' ke dalam penyimpanan perangkat
      final file = File('$path/laporan.xlsx');
      await file.writeAsBytes(fileBytes);

      print('Data berhasil disimpan di $path/laporan.xlsx');

      // Tampilkan pemberitahuan Snackbar setelah berhasil menyimpan file Excel
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data berhasil disimpan di $path/laporan.xlsx'),
          duration: Duration(seconds: 3),
        ),
      );

      // Buka berkas Excel dengan aplikasi yang sesuai
      OpenFile.open('$path/laporan.xlsx');
    }
  }

  void _cetakLaporan() async {
    print("Mencetak laporan...");
    final data = await fetchDataFromApi();
    final List<List<dynamic>> rows = [
      ['Jenis', 'Keterangan', 'Tanggal', 'Jumlah'],
    ];

    for (var transaction in data) {
      String jenis = transaction['jenis'];
      String keterangan = transaction['keterangan'];
      String createdAt = formatHari(transaction['created_at']);
      String jumlah = NumberFormat.currency(
        locale: 'id_ID',
        symbol: '',
        decimalDigits: 0,
      ).format(int.parse(transaction['jumlah']));

      rows.add([jenis, keterangan, createdAt, jumlah]);
    }

    _simpanDataExcel(data);

    String csvData = ListToCsvConverter().convert(rows);

    // Dapatkan direktori penyimpanan eksternal
    Directory? directory;
    if (Platform.isAndroid || Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    } else {
      throw UnsupportedError("Platform not supported.");
    }

    String path = directory.path;

    // Simpan file CSV dengan nama 'laporan.csv' ke dalam penyimpanan perangkat
    final file = File('$path/laporan.xlsx');
    await file.writeAsString(csvData);

    print('Laporan berhasil disimpan di $path/laporan.csv');

    // Tampilkan pemberitahuan Snackbar setelah berhasil menyimpan file CSV
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Laporan berhasil disimpan di $path/laporan.csv'),
        duration: Duration(seconds: 3),
      ),
    );
    // Buka berkas CSV dengan aplikasi yang sesuai
    OpenFile.open('$path/laporan.csv');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan'),
        backgroundColor: Color.fromRGBO(28, 151, 131, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, dashboardRoute);
          },
        ),
      ),
      body: Column(
        children: [
          // SizedBox(height: 15),
          Container(
            height: 70,
            color: Color.fromRGBO(28, 151, 131, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _showDatePicker(context, true),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(179, 250, 238, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "Tgl Awal: ${DateFormat('dd/MM/yyyy').format(tanggalAwal)}",
                    style: TextStyle(
                      color: Color.fromARGB(255, 73, 73, 73),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _showDatePicker(context, false),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(179, 250, 238, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "Tgl Akhir: ${DateFormat('dd/MM/yyyy').format(tanggalAkhir)}",
                    style: TextStyle(
                      color: Color.fromARGB(255, 73, 73, 73),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: fetchDataFromApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Tampilkan widget loading jika data belum selesai diambil dari API.
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  // Tampilkan pesan kesalahan jika terjadi error saat mengambil data dari API.
                  return Center(
                      child: Text('Terjadi kesalahan: ${snapshot.error}'));
                } else {
                  // Jika data berhasil diambil dari API, tampilkan DataTable dengan data tersebut.
                  final filteredData = snapshot.data!.where((transaction) {
                    final createdAt = DateTime.parse(transaction['created_at']);
                    return createdAt
                            .isAfter(tanggalAwal.subtract(Duration(days: 1))) &&
                        createdAt.isBefore(tanggalAkhir.add(Duration(days: 1)));
                  }).toList();

                  return SingleChildScrollView(
                    child: DataTable(
                      horizontalMargin: 16.0, // Sesuaikan padding horizontal
                      columnSpacing: 16.0, // Sesuaikan jarak antar kolom
                      dataRowColor: MaterialStateColor.resolveWith((states) {
                        return const Color.fromARGB(255, 255, 255, 255)
                            .withOpacity(0.3);
                      }),
                      columns: [
                        DataColumn(label: Text('Jenis')),
                        DataColumn(label: Text('Kegiatan')),
                        DataColumn(label: Text('Keterangan')),
                        DataColumn(label: Text('Tanggal')),
                        DataColumn(label: Text('Jumlah')),
                        DataColumn(label: Text('Aksi')),
                      ],
                      rows: getRows(filteredData),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _cetakLaporan,
        backgroundColor: Color.fromRGBO(28, 151, 131, 1),
        child: Icon(Icons.file_download),
      ),
    );
  }
}

class DetailTransaksiPage extends StatelessWidget {
  final Map<String, dynamic> transaction;

  DetailTransaksiPage({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: _buildDialogContent(context),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Detail Transaksi',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          SizedBox(height: 16.0),
          _buildDetailRow('Jenis', transaction['jenis']),
          _buildDetailRow('Kegiatan', transaction['kegiatan']),
          _buildDetailRow('Keterangan', transaction['keterangan']),
          _buildDetailRow(
            'Tanggal',
            formatHari(transaction['created_at']),
          ),
          _buildDetailRow(
            'Jumlah',
            NumberFormat.currency(
              locale: 'id_ID',
              symbol: '',
              decimalDigits: 0,
            ).format(int.parse(transaction['jumlah'])),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value),
        ],
      ),
    );
  }

  String formatHari(String inputDate) {
    final DateTime date = DateTime.parse(inputDate);
    final DateFormat formatter = DateFormat('EEEE, dd MMMM yyyy', 'id_ID');
    final String formattedHari = formatter.format(date);
    return formattedHari;
  }
}
