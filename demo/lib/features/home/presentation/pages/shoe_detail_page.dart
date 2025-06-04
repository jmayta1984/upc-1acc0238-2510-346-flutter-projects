import 'package:demo/features/home/domain/entities/shoe.dart';
import 'package:flutter/material.dart';

class ShoeDetailPage extends StatelessWidget {
  const ShoeDetailPage({super.key, required this.shoe});
  final Shoe shoe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(shoe.image),
            ),
          )
        ],
        body: Column(children: [Text(shoe.name)]),
      ),
    );
  }
}
