import 'package:flutter/material.dart';
import 'package:shop/pages/cartpage.dart';
import 'package:shop/pages/productlist.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> pages = const [
    ProductList(),
    CartPage(),
  ];
  int currentpage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: IndexedStack(
          index: currentpage,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 35,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          currentIndex: currentpage,
          onTap: (value) {
            setState(() {
              currentpage = value;
            });
          },
          selectedItemColor: Colors.amber,
          items: const [
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.shopping_cart_rounded,
              ),
            )
          ],
        ));
  }
}
