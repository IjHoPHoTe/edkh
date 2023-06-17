import 'package:dkh/src/router/constant.dart';
import 'package:dkh/src/services/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isHidden = true;
  bool passToggle = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  logo,
                  height: 70,
                  width: 70,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Image.asset(
                  logo1,
                  height: 250,
                  width: 250,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'DKH IASS',
                  style: TextStyle(
                    fontSize: 35,
                    color: Color.fromRGBO(25, 58, 112, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 25),
              Text(
                'Masukkan Terlebih Dahulu',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(25, 58, 112, 1),
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  prefixIcon:
                      Icon(Icons.person_outline, color: Color(0xFFA1A8B0)),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: _isHidden,
                decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock, color: Color(0xFFA1A8B0)),
                    suffix: InkWell(
                      onTap: () {
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      child: Icon(
                          passToggle ? Icons.visibility : Icons.visibility_off),
                    )),
              ),
              SizedBox(height: 40),
              Center(
                child: InkWell(
                  onTap: () => Get.toNamed(dashboardRoute),
                  child: Container(
                    height: 60,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Color(0xFFA1A8B0),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'Masuk',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: Text(
                  'Login Hanya Bisa Diakses Oleh Alumni',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(113, 119, 132, 1),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Yang Mempunyai ID Anggota',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(113, 119, 132, 1),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
