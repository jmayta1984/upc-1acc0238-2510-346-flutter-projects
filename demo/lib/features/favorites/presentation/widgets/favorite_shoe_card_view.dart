import 'package:demo/features/favorites/domain/entities/favorite_shoe.dart';
import 'package:demo/features/favorites/presentation/blocs/favorite_bloc.dart';
import 'package:demo/features/favorites/presentation/blocs/favorite_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteShoeCardView extends StatelessWidget {
  const FavoriteShoeCardView({super.key, required this.shoe});

  final FavoriteShoe shoe;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Image.network(
              shoe.image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shoe.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text('\$${shoe.price.toStringAsFixed(2)}'),
                const SizedBox(height: 5),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Colors.black, width: 1),
                  ),
                  onPressed: () {},
                  child: Text('Add to cart'),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      height: 200,
                      child: Column(
                        children: [
                          Text(
                            'Options',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.shopping_cart),
                            title: Text('Add to cart'),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.read<FavoriteBloc>().add(
                                RemoveFavoriteEvent(id: shoe.id),
                              );
                              Navigator.pop(context);
                            },
                            child: ListTile(
                              leading: Icon(Icons.delete),
                              title: Text('Remove from favorites'),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
