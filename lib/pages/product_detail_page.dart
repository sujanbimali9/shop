import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/pages/cartpage.dart';
import 'package:shop/Provider/cartprovider.dart';

class ProductDetail extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetail({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int selectSize = 0;
  void onTap() {
    if (selectSize != 0) {
      context.watch<CartProvider>().addproducts({
        'id': widget.product['id'],
        'title': widget.product['title'],
        'price': widget.product['price'],
        'imageUrl': widget.product['imageUrl'],
        'company': widget.product['company'],
        'sizes': selectSize,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: const Text('Added to cart'),
            action: SnackBarAction(
                label: 'Go To Cart',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CartPage()));
                })),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select size first'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Details',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(widget.product['title'] as String,
                style: Theme.of(context).textTheme.titleLarge),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              widget.product['imageUrl'] as String,
              height: 300,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(23),
                topRight: Radius.circular(23),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    '\$${widget.product['price'].toString()}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                SizedBox(
                  height: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context, index) {
                      final size =
                          (widget.product['sizes'] as List<int>)[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectSize = size;
                            });
                          },
                          child: Chip(
                            backgroundColor:
                                selectSize == size ? Colors.amber : null,
                            label: Text(
                              (size.toString()),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(100, 50),
                        maximumSize: const Size(1000, 50),
                        backgroundColor: Colors.amber),
                    onPressed: onTap,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_grocery_store_outlined,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Add To Cart',
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
