import 'package:flutter/material.dart';

class BottomNBar extends StatelessWidget {
  final VoidCallback showWishlist;
  final VoidCallback onCartPressed;
  final VoidCallback
      onSearchPressed; // A callback to trigger the wishlist modal

  const BottomNBar({
    Key? key,
    required this.showWishlist,
    required this.onCartPressed,
    required this.onSearchPressed, // Pass the showWishlist function from HomeScreen
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Ensures all items are visible
      selectedItemColor: Colors.blue, // Highlighted icon color
      unselectedItemColor: Colors.grey, // Default icon color
      onTap: (index) {
        if (index == 0) {
          // Navigate to Home
          Navigator.pushNamed(context, '/home');
        } else if (index == 1) {
          onSearchPressed();
        } else if (index == 2) {
          // Show Wishlist
          showWishlist(); // Calls the wishlist function passed from HomeScreen
        } else if (index == 3) {
          // Navigate to Cart
          onCartPressed();
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
      ],
    );
  }
}
