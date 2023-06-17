import 'dart:async';

import 'package:dkh/src/router/constant.dart';
import 'package:dkh/src/services/preference.dart';
import 'package:dkh/src/services/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  void _init() {
    Timer(const Duration(seconds: 3), () {
      getPref();
    });
  }

  void getPref() async {
    String? token = await getToken();
    if (token != '' && token != null) {
      Get.offAndToNamed(mainRoute);
    } else {
      Get.offAndToNamed(loginRoute);
    }
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Center(
            child: Image.asset(
              logo1,
              height: 250,
              width: 250,
            ),
          ),
        ),
      ),
    );
  }
}
