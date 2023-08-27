import 'dart:convert';

import 'package:dkh/src/router/constant.dart';
import 'package:dkh/src/services/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isHidden = true;
  bool passToggle = true;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // Melakukan sesuatu dengan sharedPreferences

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // final url = Uri.parse(
    //     'http://dkhiass.gosir.my.id/api/masuk'); // Ganti dengan URL API login yang sesuai
    final url = Uri.parse(
        'http://192.168.245.133:8001/api/masuk'); // Ganti dengan URL API login yang sesuai

    final response = await http.post(
      url,
      body: {
        'email': _emailController.text,
        'password': _passwordController.text,
      },
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      // prefs.setString('nama', responseData['data']['name']);
      print('HASIL ' + responseData['data']['name']);
      print('HASIL ' + responseData['data']['email']);

      String namaLogin = responseData['data']['name'];
      prefs.setString('namaLogin', namaLogin);
      Get.toNamed(dashboardRoute);
      // print('HASIL ' + responseData['data']['id']);
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => Dashboard()),
      // );
    } else {
      final errorMessage = 'Failed to login. Please try again.';
      print(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 90),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  logo,
                  height: 50,
                  width: 50,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Image.asset(
                  logo1,
                  height: 180,
                  width: 180,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'DKH IASS',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color.fromRGBO(25, 58, 112, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 25),
              Text(
                'Masukkan Terlebih Dahulu',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(25, 58, 112, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon:
                      Icon(Icons.person_outline, color: Color(0xFFA1A8B0)),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: _isHidden,
                decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
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
                  onTap: _login,
                  // => Get.toNamed(dashboardRoute),
                  child: Container(
                    height: 60,
                    width: 450,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(29, 171, 135, 1),
                      borderRadius: BorderRadius.circular(15),
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
              // SizedBox(height: 10),
              // ElevatedButton(
              //     onPressed: () {
              //       login(emailController.text, passwordController.text);
              //     },
              //     child: Text("Masuk")),

              SizedBox(height: 30),
              Center(
                child: Text(
                  'Login Hanya Bisa Diakses Oleh Bendahara',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(113, 119, 132, 1),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Wilayah dan Komisariat',
                  style: TextStyle(
                    fontSize: 14,
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
