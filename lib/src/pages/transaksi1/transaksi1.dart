import 'dart:convert';

import 'package:dkh/src/router/constant.dart';
import 'package:dkh/src/services/assets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class Transaction1Page extends StatefulWidget {
  @override
  _Transaction1PageState createState() => _Transaction1PageState();
}

class _Transaction1PageState extends State<Transaction1Page> {
  List<dynamic> kasData = [];
  String selectedJenis = '';

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

  List<dynamic> filterKasData() {
    if (selectedJenis == '') {
      return kasData;
    } else {
      return kasData.where((item) => item['jenis'] == selectedJenis).toList();
    }
  }

  String formatHari(String inputDate) {
    initializeDateFormatting('id_ID', null);
    final DateTime date = DateTime.parse(inputDate);
    final DateFormat formatter = DateFormat('EEEE, dd MMMM yyyy', 'id_ID');
    final String formattedHari = formatter.format(date);
    return formattedHari;
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
            Navigator.pushNamed(context, dashboard1Route);
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
            padding: EdgeInsets.only(left: 5, right: 5),
            child: Column(
              children: [
                SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: filterKasData().length,
                  itemBuilder: (context, index) {
                    final transaction = filterKasData()[index];
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
          )
        ],
      ),
    );
  }
}
