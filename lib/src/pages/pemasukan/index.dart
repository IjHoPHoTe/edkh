import 'package:dkh/src/router/constant.dart';
import 'package:dkh/src/services/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pemasukan extends StatefulWidget {
  const Pemasukan({super.key});

  @override
  State<Pemasukan> createState() => _PemasukanState();
}

class _PemasukanState extends State<Pemasukan> {
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
                              onTap: () => Get.toNamed(inputpemasukanRoute),
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
                  child: InkWell(
                    onTap: () => Get.toNamed(inputpemasukanRoute),
                    child: Container(
                      height: 100,
                      width: 450,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(29, 151, 131, 1),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
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
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ]),
                            ),
                            Spacer(),
                            Text(
                              'Rp. 80.000',
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
                ),
                SizedBox(height: 25),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(28, 151, 131, 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: TabBar(
                      indicator: BoxDecoration(
                        color: Color.fromRGBO(29, 171, 135, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      tabs: [
                        Tab(text: 'Pemasukan'),
                        InkWell(
                            onTap: () => Get.toNamed(pengeluaranRoute),
                            child: Tab(text: 'Pengeluaran')),
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
                            pemasukan,
                            height: 50,
                            width: 50,
                          ),
                          SizedBox(width: 10),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: 'Kraton\n',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(29, 58, 112, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: '10 Mei 2023',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromRGBO(107, 114, 128, 1),
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ]),
                          ),
                          SizedBox(width: 60),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: 'Anwar\n',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(29, 58, 112, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: 'Keterangan',
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
                            '+ Rp. 40.000',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(29, 171, 137, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
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
                                text: 'Kejayan\n',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(29, 58, 112, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: '10 Mei 2023',
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
                            '+ Rp. 40.000',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(29, 171, 137, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
