import 'package:dkh/src/router/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> with SingleTickerProviderStateMixin {
  String title = 'BottomNavigationBar';
  int _selectedIndex = 0;

  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  // int selectedIndex = 0;
  // List<IconData> data = [
  //   Icons.home_outlined,
  //   Icons.account_circle_outlined,
  //   Icons.edit_note_outlined,
  //   Icons.shopping_cart_checkout
  // ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      // padding: EdgeInsets.all(14.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(0),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white10,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(1, 2), // atur posisi bayangan (x, y)
                blurRadius: 15,
                spreadRadius: 1, // atur posisi bayangan (x, y)
              ),
            ],
          ),
          child: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black,
            labelStyle: TextStyle(fontSize: 10.0),
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: Colors.black, width: 0.0),
              insets: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 40.0),
            ),
            indicatorColor: Colors.black,
            tabs: <Widget>[
              InkWell(
                onTap: () => Get.offAndToNamed(dashboardRoute),
                child: Tab(
                  icon: Icon(
                    Icons.home,
                    size: 24.0,
                    color: _selectedIndex == 0 ? Colors.green : Colors.grey,
                  ),
                ),
              ),
              InkWell(
                onTap: () => Get.offAndToNamed(transaksiRoute),
                child: Tab(
                  icon: Icon(
                    Icons.swap_vert,
                    size: 24.0,
                    color: _selectedIndex == 0 ? Colors.green : Colors.grey,
                  ),
                ),
              ),
              InkWell(
                onTap: () => Get.offAndToNamed(laporanRoute),
                child: Tab(
                  icon: Icon(
                    Icons.insert_chart,
                    size: 24.0,
                    color: _selectedIndex == 0 ? Colors.green : Colors.grey,
                  ),
                ),
              ),
              Ink(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green, // Ubah warna sesuai keinginan Anda
                ),
                child: InkWell(
                  onTap: () => Get.offAndToNamed(addRoute),
                  child: Padding(
                    padding: const EdgeInsets.all(
                        8.0), // Sesuaikan padding sesuai kebutuhan
                    child: Icon(
                      Icons.add,
                      size: 24.0,
                      color: _selectedIndex == 0 ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
              )
            ],
            controller: _tabController,
          ),
        ),
      ),
    );
  }
}
