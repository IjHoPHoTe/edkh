import 'package:dkh/src/pages/add/add.dart';
import 'package:dkh/src/pages/dahsboard/index.dart';
import 'package:dkh/src/pages/dashboard1/index.dart';
import 'package:dkh/src/pages/inputpemasukan/index.dart';
import 'package:dkh/src/pages/inputpengeluaran/index.dart';
import 'package:dkh/src/pages/laporan/laporan.dart';
import 'package:dkh/src/pages/login/index.dart';
import 'package:dkh/src/pages/main_page.dart';
import 'package:dkh/src/pages/pemasukan/index.dart';
import 'package:dkh/src/pages/pengeluaran/index.dart';
import 'package:dkh/src/pages/root.dart';
import 'package:dkh/src/pages/transaksi/transaction.dart';
import 'package:dkh/src/pages/transaksi1/transaksi1.dart';
import 'package:dkh/src/router/constant.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(
    name: rootRoute,
    page: () => const Root(),
  ),
  GetPage(
    name: mainRoute,
    page: () => const MonthPickerScreen(),
  ),
  GetPage(
    name: loginRoute,
    page: () => const Login(),
  ),
  GetPage(
    name: dashboardRoute,
    page: () => Dashboard(),
  ),
  GetPage(
    name: dashboard1Route,
    page: () => Dashboard1(),
  ),
  GetPage(
    name: addRoute,
    page: () => AddKasPage(),
  ),
  GetPage(
    name: transaksiRoute,
    page: () => TransactionPage(),
  ),
  GetPage(
    name: transaksi1Route,
    page: () => Transaction1Page(),
  ),
  GetPage(
    name: laporanRoute,
    page: () => LaporanPage(),
  ),
  GetPage(
    name: pemasukanRoute,
    page: () => Pemasukan(),
  ),
  GetPage(
    name: pengeluaranRoute,
    page: () => Pengeluaran(),
  ),
  GetPage(
    name: inputpemasukanRoute,
    page: () => InputPemasukan(),
  ),
  GetPage(
    name: inputpengeluaranRoute,
    page: () => InputPengeluaran(),
  )
];
