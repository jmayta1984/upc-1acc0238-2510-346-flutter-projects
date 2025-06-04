import 'package:demo/core/theme/color_palette.dart';
import 'package:demo/features/home/domain/entities/shoe.dart';
import 'package:demo/features/home/presentation/views/banner_view.dart';
import 'package:demo/features/home/presentation/views/shoe_list_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Shoe> _shoes = [
    Shoe(
      id: 1,
      name: 'Nike Air Max',
      brand: 'Nike',
      image:
          'https://images.footlocker.com/is/image/EBFL2/H8050002_01?wid=500&hei=500&fmt=png',
      price: 120,
    ),
    Shoe(
      id: 2,
      name: 'Adidas Ultraboost',
      brand: 'Adidas',
      image: 'https://i.ebayimg.com/images/g/b5sAAOSwFQdmIM1o/s-l1200.png',
      price: 180,
    ),
    // Add more shoes as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          cursorColor: ColorPalette.primaryColor,
          decoration: InputDecoration(
            hintText: 'Search',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(
                width: 2,
                color: ColorPalette.primaryColor,
              ),
            ),
            suffixIcon: Icon(Icons.search),
          ),
        ),
        BannerView(),
        Expanded(child: ShoeListView(shoes: _shoes)),
      ],
    );
  }
}
