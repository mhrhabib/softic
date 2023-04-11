import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get_storage/get_storage.dart';
import 'package:softic/app/modules/home/page/home_page.dart';
import 'package:softic/app/modules/product_details/screen/add_product_screen.dart';
import 'package:softic/app/modules/profile/screen/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
final storage = GetStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(storage.read('token'));
  }

  int _selectedIndex = 0;
  List items =[
    HomPage(),
    AddProdcutScreen(),
    ProfileScreen(),
  ];

  void _onSelectedIndex(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: items.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onSelectedIndex,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add',),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Account',),
      ],)
    );
  }
}