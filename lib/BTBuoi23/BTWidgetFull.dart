import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double sum = 0;
  List<Map<String, dynamic>> carts = [];
  List<Map<String, dynamic>> product = [
    {
      "name": "Nike",
      "price": 120,
      "img":
          "https://bizweb.dktcdn.net/100/427/221/products/44577210-8934-4623-be7a-e46deb05dec8.jpg?v=1624436894967",
    },
    {
      "name": "Nike Air 2",
      "price": 140,
      "img":
          "https://bizweb.dktcdn.net/100/427/221/products/44577210-8934-4623-be7a-e46deb05dec8.jpg?v=1624436894967",
    },

    {
      "name": "Nike Air 4",
      "price": 200,
      "img":
          "https://bizweb.dktcdn.net/100/427/221/products/44577210-8934-4623-be7a-e46deb05dec8.jpg?v=1624436894967",
    },
  ];

  Widget _buildItemShoes({
    required String name,
    required String img,
    required int price,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(img, height: 150, width: 150),
            Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Text(
              price.toString(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            ElevatedButton(
              onPressed: () {
                dynamic findProduct = carts.firstWhere(
                  (item) => item['name'] == name,
                  orElse: () => {
                    "name": name,
                    "price": price,
                    "img": img,
                    "quantity": 0,
                  },
                );
                if (findProduct['quantity'] == 0) {
                  findProduct['quantity'] = 1;
                  carts.add(findProduct);
                } else {
                  findProduct['quantity']++;
                }
                setState(() {
                  sum = 0;
                  carts.forEach((item) {
                    sum += item['price'] * item['quantity'];
                  });
                });
              },
              child: Text('Thêm vào giỏ hàng'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem({
    required String name,
    required String img,
    required int quantity,
    required int price,
  }) {
    return ListTile(
      leading: Image.network(img, height: 80, width: 80),
      title: Text(name),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Gia: ${price.toString()}'),
          Text('So luong: ${quantity.toString()}'),
        ],
      ),
      trailing: IconButton(
        onPressed: () {
          setState(() {
            carts.removeWhere((item) => item['name'] == name);
            sum = 0;
            carts.forEach((item) {
              sum += item['price'] * item['quantity'];
            });
          });
        },
        icon: Icon(Icons.delete),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Giỏ hàng"),
                Expanded(
                  child: carts.isEmpty
                      ? Center(child: Text('Chưa có sản phẩm trong giỏ hàng'))
                      : ListView(
                          scrollDirection: Axis.vertical,
                          children: carts
                              .map(
                                (e) => _buildCartItem(
                                  name: e['name'],
                                  price: e['price'],
                                  img: e['img'],
                                  quantity: e['quantity'],
                                ),
                              )
                              .toList(),
                        ),
                ),
                Text('Tổng tiền ${sum} VNĐ'),
                SizedBox(height: 16),
                Text(
                  "Danh sách sản phẩm",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: product
                        .map(
                          (e) => _buildItemShoes(
                            name: e['name'],
                            price: e['price'],
                            img: e['img'],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
