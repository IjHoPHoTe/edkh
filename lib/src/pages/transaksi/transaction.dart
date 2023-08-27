import 'dart:convert';

import 'package:dkh/src/pages/Navbar.dart';
import 'package:dkh/src/router/constant.dart';
import 'package:dkh/src/services/assets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class TransactionPage extends StatefulWidget {
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  List<dynamic> kasData = [];
  String selectedJenis = '';
  DateTime _selectedMonth = DateTime.now();

  @override
  void initState() {
    super.initState();
    fetchData();
    initializeDateFormatting('id_ID', null);
  }

  Future<void> fetchData() async {
    // var url = Uri.parse('http://dkhiass.gosir.my.id/api/semua_kas');
    var url = Uri.parse('http://192.168.185.133:8001/api/semua_kas');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data['success']) {
          kasData = data['data'];
          kasData.sort((a, b) {
            DateTime dateA = DateTime.parse(a['created_at']);
            DateTime dateB = DateTime.parse(b['created_at']);
            return dateB.compareTo(dateA);
          });
        }
      });
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  }

  void setSelectedJenis(String jenis) {
    setState(() {
      selectedJenis = jenis;
    });
  }

  List<dynamic> filterDataBySelectedMonth() {
    if (_selectedMonth == null) {
      return [];
    } else {
      String selectedMonth = DateFormat('MM', 'id_ID').format(_selectedMonth);
      return kasData.where((item) {
        String itemMonth = DateFormat('MM', 'id_ID')
            .format(DateTime.parse(item['created_at']));
        return itemMonth == selectedMonth &&
            (selectedJenis.isEmpty || item['jenis'] == selectedJenis);
      }).toList();
    }
  }

  String formatHari(String inputDate) {
    initializeDateFormatting('id_ID', null);
    final DateTime date = DateTime.parse(inputDate);
    final DateFormat formatter = DateFormat('EEEE, dd MMMM yyyy', 'id_ID');
    final String formattedHari = formatter.format(date);
    return formattedHari;
  }

  void _selectMonthDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Pilih Bulan'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                for (int i = 1; i <= 12; i++)
                  ListTile(
                    title: Text(
                      DateFormat.MMMM('id_ID').format(DateTime(
                          _selectedMonth.year,
                          i)), // Gunakan locale 'id_ID' untuk format bulan
                    ),
                    onTap: () {
                      setState(() {
                        _selectedMonth = DateTime(_selectedMonth.year, i);
                      });
                      Navigator.pop(context);
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaksi'),
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => setSelectedJenis('masuk'),
                    style: ElevatedButton.styleFrom(
                      primary: selectedJenis == 'masuk'
                          ? Color.fromRGBO(28, 151, 131, 1)
                          : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15), // Adjust the radius as needed
                      ),
                    ),
                    child: Text(
                      'Kas Masuk',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => setSelectedJenis('keluar'),
                    style: ElevatedButton.styleFrom(
                      primary: selectedJenis == 'keluar'
                          ? Color.fromRGBO(28, 151, 131, 1)
                          : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15), // Adjust the radius as needed
                      ),
                    ),
                    child: Text(
                      'Kas Keluar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 0),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // Memposisikan di sebelah kiri
                  children: [
                    Center(
                      child: ElevatedButton(
                        onPressed: () => _selectMonthDialog(context),
                        style: ElevatedButton.styleFrom(
                          primary: Colors
                              .white, // Mengubah warna primary menjadi putih
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(15), // Warna border
                            side: BorderSide(
                              color: Color.fromRGBO(29, 171, 135,
                                  1), // Pertukaran warna dengan BorderRadius
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.calendar_today,
                                color: Color.fromRGBO(29, 171, 135, 1),
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Pilih Bulan :',
                                style: TextStyle(
                                    color: Color.fromRGBO(29, 171, 135, 1)),
                              ),
                              SizedBox(width: 8),
                              Text(
                                '${DateFormat.MMMM('id_ID').format(_selectedMonth)}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(29, 171, 135, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: filterDataBySelectedMonth().length,
                  itemBuilder: (context, index) {
                    final transaction = filterDataBySelectedMonth()[index];
                    String createdAt = transaction['created_at'] != null
                        ? formatHari(transaction['created_at'])
                        : '';

                    String jenis = transaction['jenis'];
                    String jumlah = transaction['jumlah'];
                    // SizedBox(height: 0,)
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          if (jenis == 'masuk')
                            Image.asset(
                              pemasukan,
                              height: 50,
                              width: 50,
                            )
                          else if (jenis == 'keluar')
                            Image.asset(
                              pengeluaran,
                              height: 50,
                              width: 50,
                            ),
                          SizedBox(width: 10),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: '${transaction['keterangan']}\n',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(29, 58, 112, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: createdAt,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromRGBO(107, 114, 128, 1),
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ]),
                          ),
                          Spacer(),
                          Text(
                            'Rp. ${NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0).format(int.parse(jumlah))}',
                            style: TextStyle(
                              fontSize: 20,
                              color: jenis == 'masuk'
                                  ? Colors.green
                                  : (jenis == 'keluar'
                                      ? Colors.red
                                      : Color.fromRGBO(29, 171, 137, 1)),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
