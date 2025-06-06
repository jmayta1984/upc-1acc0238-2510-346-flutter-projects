import 'package:demo/core/theme/color_palette.dart';
import 'package:demo/features/home/data/datasources/shoe_service.dart';
import 'package:demo/features/home/domain/entities/shoe.dart';
import 'package:demo/features/home/presentation/widgets/banner_view.dart';
import 'package:demo/features/home/presentation/widgets/shoe_list_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Shoe> _shoes = [];

  @override
  void initState() {
    loadData();
    super.initState();
  }

  Future<void> loadData() async {
    List<Shoe> shoes = await ShoeService().getShoes();
    setState(() {
      _shoes = shoes;
    });
  }

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
