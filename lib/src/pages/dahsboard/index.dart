import 'package:dkh/src/services/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dkh/src/router/constant.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              // height: 750,
              child: Stack(
                children: [
                  Container(
                    height: 300,
                    // width: MediaQuery.of(context).size.width,
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(29, 171, 135, 1)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 30),
                          child: Row(
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'M Fahmi Aziz\n',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Admin',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
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
                        SizedBox(height: 39),
                        Center(
                          child: Container(
                            height: 190,
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
                                  SizedBox(height: 30),
                                  Text(
                                    'Rp 31.000',
                                    style: TextStyle(
                                      fontSize: 35,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    'Bulan ini',
                                    style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
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
              padding: const EdgeInsets.only(),
              child: InkWell(
                onTap: () => Get.toNamed(inputpemasukanRoute),
                child: Container(
                  height: 100,
                  width: 450,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(29, 171, 135, 1),
                  ),
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
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Get.toNamed(inputpengeluaranRoute),
                    child: Container(
                      height: 100,
                      width: 450,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(240, 134, 125, 1),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
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
                  Text(
                    'Data',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(29, 58, 112, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  // ListView.builder(
                  //   itemCount: 6,
                  //   scrollDirection: Axis.horizontal,
                  //   itemBuilder: (context, index) => Container(
                  //     height: 100,
                  //     width: 100,
                  //     margin: EdgeInsets.all(10),
                  //     child: Center(
                  //       child: Text('Hello'),
                  //     ),
                  //     color: Colors.green,
                  //   ),
                  // )
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          height: 90,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Color.fromRGBO(215, 221, 234, 1)),
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 12, left: 12, top: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      pw,
                                      height: 30,
                                      width: 30,
                                    ),
                                    Icon(Icons.more_vert)
                                  ],
                                ),
                              ),
                              SizedBox(height: 15),
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Text(
                                  'PW Wilayah',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromRGBO(29, 58, 112, 1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          height: 90,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Color.fromRGBO(215, 221, 234, 1)),
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 12, left: 12, top: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      komisariat,
                                      height: 30,
                                      width: 30,
                                    ),
                                    Icon(Icons.more_vert)
                                  ],
                                ),
                              ),
                              SizedBox(height: 15),
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Text(
                                  'PK Komisariat',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromRGBO(29, 58, 112, 1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          height: 90,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Color.fromRGBO(215, 221, 234, 1)),
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 12, left: 12, top: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      user,
                                      height: 30,
                                      width: 30,
                                    ),
                                    Icon(Icons.more_vert)
                                  ],
                                ),
                              ),
                              SizedBox(height: 15),
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Text(
                                  'Anggota',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromRGBO(29, 58, 112, 1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          height: 90,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Color.fromRGBO(215, 221, 234, 1)),
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 12, left: 12, top: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      jabatan,
                                      height: 30,
                                      width: 30,
                                    ),
                                    Icon(Icons.more_vert)
                                  ],
                                ),
                              ),
                              SizedBox(height: 15),
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Text(
                                  'Jabatan',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromRGBO(29, 58, 112, 1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          height: 90,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Color.fromRGBO(215, 221, 234, 1)),
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 12, left: 12, top: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      user,
                                      height: 30,
                                      width: 30,
                                    ),
                                    Icon(Icons.more_vert)
                                  ],
                                ),
                              ),
                              SizedBox(height: 15),
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Text(
                                  'User',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromRGBO(29, 58, 112, 1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Mei 2023',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromRGBO(29, 58, 112, 1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Detail >',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromRGBO(29, 58, 112, 1),
                                fontWeight: FontWeight.w400,
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
                              pengeluaran,
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
                                  text: '02 Mei 2023',
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
