import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/Provider/cartprovider.dart';
import 'pages/homepage.dart';

void main() {
  runApp(const Shop());
}

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(254, 206, 1, 1),
            ),
            appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
            )),
            textTheme: const TextTheme(
              titleLarge: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.2),
              titleSmall: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              titleMedium: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              bodySmall: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            useMaterial3: true,
          ),
          home: const MyHomePage()),
    );
  }
}
