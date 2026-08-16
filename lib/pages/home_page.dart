import 'package:flutter/material.dart';
import 'package:store/models/product.dart';
import 'package:store/widgets/my_list_title.dart';
import 'package:store/widgets/my_text_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final List<Product> dummyProducts = [
    Product(
      id: '1',
      title: 'T-shirt',
      description: 'Comfortable everyday T-shirt',
      price: 30,
      imageUrl: 'assets/photo.jpeg',
    ),
    Product(
      id: '2',
      title: 'Pant',
      description: 'Comfortable casual pants',
      price: 30,
      imageUrl: 'assets/photo1.jpeg',
    ),
    Product(
      id: '3',
      title: 'Black T-Shirt',
      description: 'Classic black cotton T-shirt',
      price: 30,
      imageUrl: 'assets/photo3.jpeg',
    ),
    Product(
      id: '4',
      title: 'White T-Shirt',
      description: 'Simple white cotton T-shirt',
      price: 25,
      imageUrl: 'assets/photo4.jpeg',
    ),
    Product(
      id: '5',
      title: 'Oversized T-Shirt',
      description: 'Comfortable oversized T-shirt',
      price: 35,
      imageUrl: 'assets/photo5.jpeg',
    ),
    Product(
      id: '6',
      title: 'Graphic T-Shirt',
      description: 'Modern graphic printed T-shirt',
      price: 40,
      imageUrl: 'assets/photo6.jpeg',
    ),
    Product(
      id: '7',
      title: 'Black Jeans',
      description: 'Classic black slim jeans',
      price: 60,
      imageUrl: 'assets/photo7.jpeg',
    ),
    Product(
      id: '8',
      title: 'Blue Jeans',
      description: 'Classic blue denim jeans',
      price: 65,
      imageUrl: 'assets/photo8.jpeg',
    ),
    Product(
      id: '9',
      title: 'Cargo Pants',
      description: 'Comfortable cargo pants',
      price: 70,
      imageUrl: 'assets/photo9.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final latestProducts = dummyProducts.take(4).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop App'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyTextTitle(text: 'Latest products'),
            const SizedBox(height: 10),

            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: latestProducts.length,
                itemBuilder: (context, index) {
                  return MyListTitle(
                    product: latestProducts[index],
                  );
                },
              ),
            ),

            const SizedBox(height: 24),
            const MyTextTitle(text: 'All products'),
            const SizedBox(height: 10),

            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: dummyProducts.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 220,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                return MyListTitle(
                  product: dummyProducts[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}