import 'package:flutter/material.dart';
import 'package:shop/widgets/product_card.dart';
import 'package:shop/pages/product_detail_page.dart';

import '../variable.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const [
    'All',
    'Goldstar',
    'Addidas',
    'Nike',
    'Bata',
  ];

  late String selectedFilter;

  @override
  void initState() {
    selectedFilter = filters[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(23),
      ),
    );
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, top: 30, right: 40, bottom: 30),
                  child: Text('Shoes\nCollection',
                      style: Theme.of(context).textTheme.titleLarge),
                ),
                Expanded(
                  child: Container(
                    // padding: const EdgeInsets.symmetric(vertical: 20),
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'search',
                        prefixIcon: Icon(Icons.search),
                        prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: filters.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (contex, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFilter = filters[index];
                          });
                        },
                        child: Chip(
                          backgroundColor: selectedFilter == filters[index]
                              ? Colors.yellowAccent
                              : const Color.fromARGB(255, 224, 222, 219),
                          label: Text(
                            filters[index],
                            style: const TextStyle(color: Colors.black),
                          ),
                          side: const BorderSide(
                            color: Color.fromARGB(255, 224, 222, 219),
                          ),
                          padding: const EdgeInsets.all(15),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 500,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: products.length,
                  itemBuilder: (contex, index) {
                    final product = products[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (contex) => ProductDetail(
                            product: products[index],
                          ),
                        ));
                      },
                      child: Column(
                        children: [
                          // Text(product.toString()),
                          ProductCard(
                            title: product['title'] as String,
                            price: product['price'] as double,
                            image: product['imageUrl'] as String,
                            backgroundColor: index.isEven
                                ? const Color.fromRGBO(216, 240, 253, 1)
                                : const Color.fromRGBO(245, 247, 249, 1),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
