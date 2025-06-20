import 'package:demo/core/theme/color_palette.dart';
import 'package:demo/features/cart/data/cart_item_service.dart';
import 'package:demo/features/home/domain/entities/shoe.dart';
import 'package:demo/features/home/presentation/blocs/shoe_bloc.dart';
import 'package:demo/features/home/presentation/blocs/shoe_event.dart';
import 'package:demo/features/home/presentation/blocs/shoe_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoeDetailPage extends StatefulWidget {
  const ShoeDetailPage({super.key, required this.shoe});
  final Shoe shoe;

  @override
  State<ShoeDetailPage> createState() => _ShoeDetailPageState();
}

class _ShoeDetailPageState extends State<ShoeDetailPage> {
  int _selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    final Shoe shoe = widget.shoe;
    final List<ShoeSize> sizes = shoe.sizes;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: ColorPalette.primaryColor,
            ),
            onPressed: (_selectedIndex >= 0)
                ? () {
                    CartItemService().addCartItem(shoe.id, 'emilys');
                  }
                : null,
            child: Text("Add to cart"),
          ),
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Center(
                    child: Hero(
                      tag: widget.shoe.id,
                      child: Image.network(widget.shoe.image),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    right: 0,
                    child: IconButton(
                      onPressed: () {
                        context.read<ShoeBloc>().add(
                          ToggleShoeEvent(shoe: shoe),
                        );
                      },
                      icon: BlocBuilder<ShoeBloc, ShoeState>(
                        builder: (context, state) {
                          if (state is LoadedShoeState) {
                            final isFavorite = state.shoes
                                .where((e) => e.id == shoe.id)
                                .first
                                .isFavorite;
                            return Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                            );
                          }
                          return Icon(Icons.favorite_border);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text(
                    widget.shoe.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Spacer(),
                  Text(
                    '\$ ${widget.shoe.price}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              Text(widget.shoe.description),
              Text(
                'Size',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: sizes.length,
                  itemBuilder: (context, index) {
                    bool isSelected = _selectedIndex == index;
                    final ShoeSize size = sizes[index];
                    return GestureDetector(
                      onTap: () => setState(() {
                        _selectedIndex = index;
                      }),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: isSelected
                              ? ColorPalette.primaryColor
                              : Colors.white,
                        ),
                        height: 40,
                        width: 40,
                        child: Center(
                          child: Text(
                            size.size,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 8),
                ),
              ),
              if (_selectedIndex >= 0)
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Center(
                        child: Text(sizes[_selectedIndex].stock.toString()),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
