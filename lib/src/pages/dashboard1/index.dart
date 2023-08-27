import 'dart:convert';

import 'package:dkh/src/controller/TransaksiController.dart';
import 'package:dkh/src/router/constant.dart';
import 'package:dkh/src/services/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard1 extends StatefulWidget {
  const Dashboard1({Key? key}) : super(key: key);

  @override
  State<Dashboard1> createState() => _Dashboard1State();
}

class _Dashboard1State extends State<Dashboard1> {
  String showYear = 'Select Year';
  DateTime _selectedYear = DateTime.now();
  String showMonth = 'Select Month';
  DateTime _selectedMonth = DateTime.now();
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;
  TransaksiController log = Get.put(TransaksiController());
  final TransaksiController produk = Get.put(TransaksiController());
  String _namaLogin = '';
  DateTime selectedDate = DateTime.now();
  late TextEditingController _dateController;
  List<dynamic> kasData = [];
  String selectedJenis = '';
  String? jenis;
  String? jumlah;
  String? keterangan;
  int totalKasMasuk = 0;
  int totalKasKeluar = 0;

  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  void _updateSelectedMonth(int month) {
    setState(() {
      selectedMonth = month;
      showMonth = months[month - 1];
    });
  }

  void _initializeLocalizations() {
    initializeDateFormatting('id_ID', null);
  }

  void _selectYear(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(selectedYear, selectedMonth),
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime(DateTime.now().year + 10),
      locale: const Locale('id', 'ID'),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedYear = pickedDate;
        selectedYear = pickedDate.year;
        showMonth = DateFormat('MMMM', 'id_ID').format(pickedDate);
        showYear = selectedYear.toString();
      });
    }
  }

  void _selectMonth(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(selectedYear, selectedMonth),
      firstDate: DateTime(DateTime.now().year - 10, 1),
      lastDate: DateTime(DateTime.now().year + 10, 12),
      locale: const Locale('id', 'ID'),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedMonth = pickedDate;
        selectedMonth = pickedDate.month;
        showMonth = DateFormat('MMMM', 'id_ID').format(pickedDate);
        showMonth = months[selectedMonth - 1];
      });
      fetchData();
    }
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
                          _selectedYear.year,
                          i)), // Gunakan locale 'id_ID' untuk format bulan
                    ),
                    onTap: () {
                      setState(() {
                        selectedMonth = i;
                        showMonth = DateFormat.MMMM('id_ID')
                            .format(DateTime(_selectedYear.year, i));
                      });
                      Navigator.pop(context);
                      fetchData();
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Data contoh untuk bulan-bulan tertentu
  List<Map<String, dynamic>> sampleData = [
    {'bulan': 1, 'data': 'Data bulan Januari'},
    {'bulan': 2, 'data': 'Data bulan Februari'},
    {'bulan': 3, 'data': 'Data bulan Maret'},
    {'bulan': 4, 'data': 'Data bulan April'},
    {'bulan': 5, 'data': 'Data bulan Mei'},
    {'bulan': 6, 'data': 'Data bulan Juni'},
    {'bulan': 7, 'data': 'Data bulan Juli'},
    {'bulan': 8, 'data': 'Data bulan Agustus'},
    {'bulan': 9, 'data': 'Data bulan September'},
    {'bulan': 10, 'data': 'Data bulan Oktober'},
    {'bulan': 11, 'data': 'Data bulan November'},
    {'bulan': 12, 'data': 'Data bulan Desember'},
  ];

  // Fungsi untuk memfilter data berdasarkan bulan yang dipilih
  List<Map<String, dynamic>> filterDataBySelectedMonth() {
    return sampleData.where((data) => data['bulan'] == selectedMonth).toList();
  }

  getAtribute() async {
    // jenis = await getNama();/

    String? jenis;
    String? jumlah;
    String? keterangan;
    setState(() {
      // jenis = jenis;
      // jumlah = jumlah;
      // keterangan = keterangan;
      // storeName = await getStore();
    });
  }

  get child => null;

  @override
  void initState() {
    super.initState();
    _loadNamaLogin();
    selectedDate = DateTime.now();
    initializeDateFormatting('id_ID', null);
    _selectedMonth = DateTime.now();
    selectedMonth = _selectedMonth.month;
    showMonth = DateFormat.MMMM('id_ID').format(
        _selectedMonth); // Update showMonth sesuai dengan bulan saat ini
    fetchData();
  }

  Future<void> _loadNamaLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? namaLogin = prefs.getString('namaLogin');
    setState(() {
      _namaLogin = namaLogin ?? '';
    });
  }

  void showDatePickerDialog() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2024),
      locale: const Locale('id', 'ID'),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> fetchData() async {
    // var url = Uri.parse('http://dkhiass.gosir.my.id/api/semua_kas');
    var url = Uri.parse('http://192.168.245.133:8001/api/semua_kas');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data['success']) {
          kasData = data['data'];
          kasData = data['data'];
          kasData.sort((a, b) {
            DateTime dateA = DateTime.parse(a['created_at']);
            DateTime dateB = DateTime.parse(b['created_at']);
            return dateB.compareTo(dateA);
          });
          calculateTotalKasMasukBySelectedMonth(); // Hitung total kas masuk
          calculateTotalKasKeluarBySelectedMonth(); // Hitung total kas keluar
        }
      });
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  }

  int calculateTotalKasMasukBySelectedMonth() {
    int totalKasMasukBySelectedMonth = 0; // Reset total kas masuk

    for (var transaction in filterKasData()) {
      if (transaction['jenis'] == 'masuk') {
        totalKasMasukBySelectedMonth += int.parse(transaction['jumlah']);
      }
    }

    return totalKasMasukBySelectedMonth;
  }

  int calculateTotalKasKeluarBySelectedMonth() {
    int totalKasKeluarBySelectedMonth = 0; // Reset total kas keluar

    for (var transaction in filterKasData()) {
      if (transaction['jenis'] == 'keluar') {
        totalKasKeluarBySelectedMonth += int.parse(transaction['jumlah']);
      }
    }

    return totalKasKeluarBySelectedMonth;
  }

  void setSelectedJenis(String jenis) {
    setState(() {
      selectedJenis = jenis;
    });
  }

  List<dynamic> filterKasData() {
    return kasData.where((item) {
      DateTime transactionDate = DateTime.parse(item['created_at']);
      return transactionDate.year == selectedYear &&
          transactionDate.month == selectedMonth;
    }).toList();
  }

  String formatHari(String inputDate) {
    initializeDateFormatting('id_ID', null);
    final DateTime date = DateTime.parse(inputDate);
    final DateFormat formatter = DateFormat('EEEE, dd MMMM yyyy', 'id_ID');
    final String formattedHari = formatter.format(date);
    return formattedHari;
  }

  int calculateTotalSisaKas() {
    int totalKasMasuk = 0;
    int totalKasKeluar = 0;

    for (var transaction in kasData) {
      if (transaction['jenis'] == 'masuk') {
        totalKasMasuk += int.parse(transaction['jumlah']);
      } else if (transaction['jenis'] == 'keluar') {
        totalKasKeluar += int.parse(transaction['jumlah']);
      }
    }

    return totalKasMasuk - totalKasKeluar;
  }
  // int calculateSisaSaldoBySelectedMonth() {
  //   int totalKasMasukBySelectedMonth = 0; // Reset total kas masuk
  //   int totalKasKeluarBySelectedMonth = 0; // Reset total kas keluar

  //   for (var transaction in filterKasData()) {
  //     if (transaction['jenis'] == 'masuk') {
  //       totalKasMasukBySelectedMonth += int.parse(transaction['jumlah']);
  //     } else if (transaction['jenis'] == 'keluar') {
  //       totalKasKeluarBySelectedMonth += int.parse(transaction['jumlah']);
  //     }
  //   }

  //   return totalKasMasukBySelectedMonth - totalKasKeluarBySelectedMonth;
  // }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.yMMMM('id_ID').format(selectedDate);
    return Scaffold(
      backgroundColor: Color(0xFFEFFFFB),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                // height: 750,
                child: Stack(
                  children: [
                    Container(
                      height: 190,
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      // width: MediaQuery.of(context).size.width,
                      decoration:
                          BoxDecoration(color: Color.fromRGBO(29, 171, 135, 1)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 5, right: 5, top: 30),
                            child: Row(
                              children: <Widget>[
                                InkWell(
                                  onTap: () => Get.toNamed(loginRoute),
                                  child: Container(
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromRGBO(29, 171, 135, 1),
                                      border: Border.all(color: Colors.white),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    _selectMonthDialog(context);
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 145,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(29, 171, 135, 1),
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            '${showMonth} ${_selectedYear.year}',
                                            overflow: TextOverflow
                                                .ellipsis, // Membuat teks menjadi elipsis jika overflow
                                            softWrap:
                                                false, // Membuat teks tidak wrap ke baris baru
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Icon(
                                          Icons.calendar_today,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Center(
                            child: Container(
                              height: 120,
                              width: 450,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(28, 151, 131, 1),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              child: Padding(
                                padding: EdgeInsets.only(left: 20, top: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sisa Kas',
                                      style: TextStyle(
                                        fontSize: 23,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),

                                    SizedBox(height: 5),
                                    Text(
                                      'Rp. ${NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0).format(calculateTotalSisaKas())}',
                                      style: TextStyle(
                                        fontSize: 35,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    // SizedBox(height: 5),
                                    // Text(
                                    //   'Rp. ${NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0).format(calculateSisaSaldoBySelectedMonth())}',
                                    //   style: TextStyle(
                                    //     fontSize: 35,
                                    //     color: Colors.white,
                                    //     fontWeight: FontWeight.bold,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: InkWell(
                  onTap: () => Get.toNamed(inputpemasukanRoute),
                  child: Container(
                    height: 80,
                    width: 450,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(29, 171, 135, 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            pemasukan,
                            height: 50,
                            width: 50,
                          ),
                          SizedBox(width: 10),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: 'Pemasukan\n',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: 'Bulan Ini',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ]),
                          ),
                          Spacer(),
                          Text(
                            'Rp. ${NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0).format(calculateTotalKasMasukBySelectedMonth())}',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => Get.toNamed(inputpengeluaranRoute),
                      child: Container(
                        height: 80,
                        width: 450,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(240, 134, 125, 1),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            children: <Widget>[
                              Image.asset(
                                pengeluaran,
                                height: 50,
                                width: 50,
                              ),
                              SizedBox(width: 10),
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: 'Pengeluaran\n',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Bulan Ini',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ]),
                              ),
                              Spacer(),
                              Text(
                                'Rp. ${NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0).format(calculateTotalKasKeluarBySelectedMonth())}',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Transaksi',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromRGBO(29, 58, 112, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Get.toNamed(transaksi1Route),
                                child: Text(
                                  'Detail >',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromRGBO(29, 58, 112, 1),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: filterKasData()
                                .take(4)
                                .length, // Menampilkan maksimal 5 data terbaru
                            itemBuilder: (context, index) {
                              final transaction = filterKasData()[index];
                              String createdAt =
                                  transaction['created_at'] != null
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
                                          text:
                                              '${transaction['keterangan']}\n',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color:
                                                Color.fromRGBO(29, 58, 112, 1),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: createdAt,
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromRGBO(
                                                107, 114, 128, 1),
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
                                                : Color.fromRGBO(
                                                    29, 171, 137, 1)),
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
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Navbar(),
    );
  }
}
