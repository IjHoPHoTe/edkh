import 'package:dkh/src/router/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputPengeluaran extends StatefulWidget {
  const InputPengeluaran({super.key});

  @override
  State<InputPengeluaran> createState() => _InputPengeluaranState();
}

class _InputPengeluaranState extends State<InputPengeluaran> {
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
                              onTap: () => Get.toNamed(dashboardRoute),
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
                                  text: 'Input Transaksi',
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
                SizedBox(height: 25),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                        InkWell(
                            onTap: () => Get.toNamed(inputpemasukanRoute),
                            child: Tab(text: 'Pemasukan')),
                        Tab(text: 'Pengeluaran'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Color(0xFFE5E7EB)),
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            children: [
                              Icon(
                                Icons.home_work_outlined,
                                color: Color(0xFFA0A8B0),
                              ),
                              SizedBox(width: 15),
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: 'Pilih Komisariat',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFFA0A8B0),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ]),
                              ),
                              Spacer(),
                              Icon(
                                Icons.navigate_next_sharp,
                                color: Color(0xFFA0A8B0),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Color(0xFFE5E7EB)),
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_today_outlined,
                                color: Color(0xFFA0A8B0),
                              ),
                              SizedBox(width: 15),
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: '10 Mei 2023',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFFA0A8B0),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Color(0xFFE5E7EB)),
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            children: [
                              Icon(
                                Icons.book,
                                color: Color(0xFFA0A8B0),
                              ),
                              SizedBox(width: 15),
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: 'Keterangan / Tidak Wajib Di Isi',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFFA0A8B0),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Color(0xFFE5E7EB)),
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            children: [
                              Icon(
                                Icons.all_inbox,
                                color: Color(0xFFA0A8B0),
                              ),
                              SizedBox(width: 15),
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: 'Jumlah Pemasukan',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFFA0A8B0),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 35),
                      InkWell(
                        onTap: () => Get.toNamed(pengeluaranRoute),
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Color(0xFF1DAB87),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
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
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
