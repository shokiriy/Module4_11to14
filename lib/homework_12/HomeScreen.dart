import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:four_apps/custom_button.dart';
import 'package:four_apps/homework_12/DetailsScreen.dart';
import 'package:four_apps/homework_12/SearchScreen.dart';
import 'package:four_apps/homework_12/model/product.dart';
import 'package:four_apps/homework_12/model/navigationBar.dart';
import 'package:four_apps/homework_13/HomeScreen.dart';
import 'package:four_apps/homework_13/OnBoarding.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> meals = [
    Product(name: 'Artsy', price: 564, image: 'assets/images/bag1.png'),
    Product(name: 'Berkely', price: 687, image: 'assets/images/bag2.png'),
    Product(name: 'Capucinus', price: 1200, image: 'assets/images/bag3.png'),
    Product(name: 'Monogram', price: 1638, image: 'assets/images/bag4.png'),
  ];
  final Map<Product, int> _cart = {};
  // List of images for the carousel
  final List<String> carouselImages = [
    'assets/images/carousel1.png',
    'assets/images/carousel2.png',
    'assets/images/bag3.png',
  ];

  final Set<Product> _wishlist = {};
  // Store wishlist items
  void _toggleWishlist(Product product) {
    setState(() {
      if (_wishlist.contains(product)) {
        _wishlist.remove(product);
      } else {
        _wishlist.add(product);
      }
    });
  }

  // Function to show the wishlist modal
  void _showWishlist(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          maxChildSize: 0.8,
          minChildSize: 0.4,
          builder: (_, scrollController) {
            return StatefulBuilder(
              // Use StatefulBuilder to rebuild the UI on state changes
              builder: (BuildContext context, StateSetter setModalState) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: 40,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      const Text(
                        'Your Wishlist',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: _wishlist.isEmpty
                            ? const Center(
                                child: Text(
                                  'Your wishlist is empty!',
                                  style: TextStyle(fontSize: 16),
                                ),
                              )
                            : ListView.builder(
                                controller: scrollController,
                                itemCount: _wishlist.length,
                                itemBuilder: (_, index) {
                                  final product = _wishlist
                                      .toList()[index]; // Convert to list
                                  return ListTile(
                                    leading:
                                        Image.asset(product.image, width: 50),
                                    title: Text(product.name),
                                    subtitle: Text('\$${product.price}'),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        // Update the wishlist and rebuild the modal state
                                        setState(() {
                                          _wishlist.remove(product);
                                        });
                                        setModalState(() {});
                                      },
                                    ),
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  void _showCart(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          maxChildSize: 0.8,
          minChildSize: 0.4,
          builder: (_, scrollController) {
            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setModalState) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: 40,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      const Text(
                        'Your Cart',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: _cart.isEmpty
                            ? const Center(
                                child: Text(
                                  'Your cart is empty!',
                                  style: TextStyle(fontSize: 16),
                                ),
                              )
                            : ListView.builder(
                                controller: scrollController,
                                itemCount: _cart.length,
                                itemBuilder: (_, index) {
                                  final product = _cart.keys.toList()[index];
                                  final quantity = _cart[product]!;
                                  return ListTile(
                                    leading: Image.asset(
                                      product.image,
                                      width: 50,
                                    ),
                                    title: Text(product.name),
                                    subtitle:
                                        Text('\$${product.price * quantity}'),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.remove),
                                          onPressed: () {
                                            setModalState(() {
                                              if (_cart[product] == 1) {
                                                _cart.remove(product);
                                              } else {
                                                _cart[product] =
                                                    _cart[product]! - 1;
                                              }
                                            });
                                          },
                                        ),
                                        Text(quantity.toString()),
                                        IconButton(
                                          icon: const Icon(Icons.add),
                                          onPressed: () {
                                            setModalState(() {
                                              _cart[product] =
                                                  _cart[product]! + 1;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Implement proceed to buy action
                        },
                        child: const Text('PROCEED TO BUY'),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Bagzz', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_pin_rounded),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // Header Carousel
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CarouselSlider(
                  items: carouselImages.map((imagePath) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 200.0, // Adjust the height of the carousel
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    aspectRatio: 16 / 9,
                    autoPlayInterval: const Duration(seconds: 3),
                  ),
                ),
              ),
              // GridView for Products
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.75, // Adjust aspect ratio for images
                    ),
                    itemCount: meals.length,
                    itemBuilder: (context, index) {
                      final product = meals[index];
                      return BagItem(
                        product: product,
                        isLiked: _wishlist.contains(product),
                        onToggleLike: () => _toggleWishlist(product),
                        onShopNow: () {
                          // Perform action when Shop Now is clicked
                        },
                        onAddToCart: () {
                          setState(() {
                            if (_cart.containsKey(product)) {
                              _cart[product] = _cart[product]! + 1;
                            } else {
                              _cart[product] = 1;
                            }
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          CustomFloatingButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OnBoardingScreen()),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNBar(
        showWishlist: () => _showWishlist(context),
        onCartPressed: () {
          _showCart(context); // Show the cart when the cart button is pressed
        },
        onSearchPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchScreen(products: meals),
            ),
          );
        },
      ),
    );
  }
}

class BagItem extends StatefulWidget {
  final Product product;
  final bool isLiked;
  final VoidCallback onToggleLike;
  final VoidCallback onShopNow;
  final VoidCallback onAddToCart;

  const BagItem({
    Key? key,
    required this.product,
    required this.isLiked,
    required this.onToggleLike,
    required this.onShopNow,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  State<BagItem> createState() => _BagItemState();
}

class _BagItemState extends State<BagItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailsScreen(product: widget.product),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Image.asset(
                    widget.product.image,
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                ),
              ),
              Text(
                widget.product.name,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              TextButton(
                onPressed: () {
                  widget.onAddToCart(); // Call the passed callback
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Added to cart!')),
                  );
                },
                child: const Text('Shop Now'),
              ),
            ],
          ),
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: widget.onToggleLike, // Toggles the wishlist state
              child: Icon(
                widget.isLiked ? Icons.favorite : Icons.favorite_border,
                color: widget.isLiked ? Colors.red : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
