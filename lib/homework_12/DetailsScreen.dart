import 'package:flutter/material.dart';
import 'package:four_apps/homework_12/model/product.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0; // To track the current page index

  final List<String> _explanations = [
    'This is a beautifully designed bag. It is crafted from high-quality materials, ensuring durability and style.',
    'Shipping is available worldwide. Free shipping on orders over \$500. Estimated delivery time: 5-7 business days.',
    'We accept all major credit cards, PayPal, and bank transfers. Installment payment plans are also available.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image and Details
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    widget.product.image,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                // Name, Price, and Shop Now Button
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '\$${widget.product.price}',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Handle "Shop Now" action
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Added to cart!'),
                            ),
                          );
                        },
                        child: const Text('Shop Now'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Horizontal Sliding Explanation Headers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTab('Description', 0),
                _buildTab('Shipping', 1),
                _buildTab('Payment', 2),
              ],
            ),

            // Horizontal Sliding Content
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                controller: PageController(initialPage: 0),
                itemCount: _explanations.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      _explanations[index],
                      style: const TextStyle(fontSize: 16, height: 1.5),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    final bool isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: 40,
              height: 3,
              color: Colors.blue,
            ),
        ],
      ),
    );
  }
}
