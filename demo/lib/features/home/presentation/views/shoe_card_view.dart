import 'package:demo/features/home/domain/entities/shoe.dart';
import 'package:flutter/material.dart';

class ShoeCardView extends StatelessWidget {
  const ShoeCardView({super.key, required this.shoe});
  final Shoe shoe;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(child: Image.network(shoe.image)),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      shoe.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(shoe.brand, style: TextStyle(color: Colors.grey)),
                    Text(
                      '\$ ${shoe.price}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border),
            ),
          ),
        ],
      ),
    );
  }
}
