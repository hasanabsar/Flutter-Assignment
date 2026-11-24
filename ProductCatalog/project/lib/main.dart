import "package:flutter/material.dart";

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: Home()
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  final List<Map<String, dynamic>> products = const [
    {
      'name': 'Headphones',
      'price': 'Rs. 4,500',
      'image':
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400',
    },
    {
      'name': 'Smart Watch',
      'price': 'Rs. 6,000',
      'image':
          'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400',
    },
    {
      'name': 'Sneakers',
      'price': 'Rs. 3,500',
      'image':
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
    },
    {
      'name': 'Backpack',
      'price': 'Rs. 2,500',
      'image':
          'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400',
    },
    {
      'name': 'Smartphone',
      'price': 'Rs. 45,000',
      'image':
          'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400',
    },
    {
      'name': 'Camera',
      'price': 'Rs. 25,000',
      'image':
          'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?w=400',
    },
    {
      'name': 'Sunglasses',
      'price': 'Rs. 1,500',
      'image':
          'https://images.unsplash.com/photo-1511499767150-a48a237f0083?w=400',
    },
    {
      'name': 'Laptop',
      'price': 'Rs. 120,000',
      'image':
          'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400',
    },
    {
      'name': 'Keyboard',
      'price': 'Rs. 3,000',
      'image':
          'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=400',
    },
    {
      'name': 'Speaker',
      'price': 'Rs. 5,000',
      'image':
          'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=400',
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text("Product Catalog"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.67,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              elevation: 4,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
               clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.network(
                      product['image'],
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(Icons.image_not_supported),
                        );
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product['name'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          product['price'],
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // ScaffoldMessenger.of(context)
                              //     .showSnackBar(
                              //   SnackBar(
                              //     content: Text(
                              //       '${product['name']} Added to Cart',
                              //     ),
                              //   ),
                              // );
                            },
                            child: const Text('Add to Cart'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )  
            );
          },
        ),
      ),
    );
  }
}
