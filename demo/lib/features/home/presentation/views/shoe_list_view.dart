import 'package:demo/features/home/domain/entities/shoe.dart';
import 'package:demo/features/home/presentation/pages/shoe_detail_page.dart';
import 'package:demo/features/home/presentation/views/shoe_card_view.dart';
import 'package:flutter/material.dart';

class ShoeListView extends StatelessWidget {
  const ShoeListView({super.key, required this.shoes});
  final List<Shoe> shoes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: shoes.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        final Shoe shoe = shoes[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ShoeDetailPage(shoe: shoe)),
          ),
          child: ShoeCardView(shoe: shoe),
        );
      },
    );
  }
}
