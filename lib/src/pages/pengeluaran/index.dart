import 'package:dkh/src/router/constant.dart';
import 'package:dkh/src/services/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pengeluaran extends StatefulWidget {
  const Pengeluaran({super.key});

  @override
  State<Pengeluaran> createState() => _PengeluaranState();
}

class _PengeluaranState extends State<Pengeluaran> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(29, 171, 135, 1)),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 20, left: 20, top: 15),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () => Get.toNamed(inputpengeluaranRoute),
                              child: Icon(
                                Icons.arrow_back_ios_sharp,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: 'Transaksi',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ]),
                            ),
                            Spacer(),
                            Container(
                              height: 30,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(29, 171, 135, 1),
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Mei, ',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '2023 ',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 2),
                                  Icon(
                                    Icons.calendar_today,
                                    size: 20,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: 100,
                    width: 450,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(240, 134, 25, 1),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
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
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ]),
                          ),
                          Spacer(),
                          Text(
                            'Rp. 49.000',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(240, 134, 25, 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: TabBar(
                      indicator: BoxDecoration(
                        color: Color.fromRGBO(29, 171, 135, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      tabs: [
                        InkWell(
                            onTap: () => Get.toNamed(pemasukanRoute),
                            child: Tab(text: 'Pemasukkan')),
                        Tab(text: 'Pengeluaran'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mei 2023',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(29, 58, 112, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
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
                                text: 'Konsumsi\n',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(29, 58, 112, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: '13 Mei 2023',
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
                            '- Rp. 29.000',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(240, 134, 25, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
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
                                text: 'Konsumsi\n',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(29, 58, 112, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: '25 Mei 2023',
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
                            '- Rp. 20.000',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(240, 134, 25, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
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
