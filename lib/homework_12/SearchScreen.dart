import 'package:flutter/material.dart';
import 'package:four_apps/homework_12/DetailsScreen.dart';
import 'package:four_apps/homework_12/model/product.dart';

class SearchScreen extends StatefulWidget {
  final List<Product> products; // Pass the product list to the search screen

  const SearchScreen({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Product> _suggestedProducts = [];

  void _onSearchChanged(String query) {
    setState(() {
      _suggestedProducts = widget.products
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Bags'),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search for bags...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: _onSearchChanged,
            ),
          ),
          // Suggestions List
          Expanded(
            child: ListView.builder(
              itemCount: _suggestedProducts.length,
              itemBuilder: (context, index) {
                final product = _suggestedProducts[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('\$${product.price}'),
                  onTap: () {
                    // Navigate to product details
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailsScreen(product: product),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
