import 'package:demo/core/theme/color_palette.dart';
import 'package:demo/features/favorites/presentation/pages/favorites_page.dart';
import 'package:demo/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    FavoritesPage(),
    Text("Cart"),
    Text("Profile")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        selectedItemColor: ColorPalette.primaryColor,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_outline),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.shopping_cart),
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
