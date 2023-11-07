import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/Provider/cartprovider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: ListView.builder(
          itemCount: cart.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Card(
                elevation: 7,
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage(cart[index]['imageUrl'] as String),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            'Delete',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          content: Text(
                            'Are you sure you want to delete ${cart[index]['title']} \nfrom your cart',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'No',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            TextButton(
                              onPressed: () {
                                context
                                    .read<CartProvider>()
                                    .removeproducts(cart[index]);
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Yes',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.delete),
                    color: Colors.red,
                  ),
                  minVerticalPadding: 20,
                  tileColor: const Color.fromARGB(255, 222, 215, 215),
                  title: Text((cart[index]['title'].toString())),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('size: ${cart[index]['sizes']}'),
                      Text('price: ${cart[index]['price']}')
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
