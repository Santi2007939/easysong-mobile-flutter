import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const new({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  final Map<String, List<Icon>> icons = {
  "home": [Icon(Icons.home), Icon(Icons.home_outlined)],
  "favorites": [Icon(Icons.favorite), Icon(Icons.favorite_outline)],
  "cart": [Icon(Icons.shopping_cart), Icon(Icons.shopping_cart_outlined)],
  };

  final List<Widget> pages = [Text("Home"), Text("Favorites"), Text("Cart")];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[selectedIndex]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        destinations: [
          NavigationDestination(
            selectedIcon: icons["home"]![0],
            icon: icons["home"]![1],
            label: "Home",
          ),
          NavigationDestination(
            selectedIcon: icons["favorites"]![0],
            icon: icons["favorites"]![1],
            label: "Favorites",
          ),
          NavigationDestination(
            selectedIcon: icons["cart"]![0],
            icon: icons["cart"]![1],
            label: "Cart",
          ),
        ],
      ),
    );
  }
}
