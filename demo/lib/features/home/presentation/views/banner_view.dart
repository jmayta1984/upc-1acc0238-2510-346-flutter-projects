import 'package:demo/core/theme/color_palette.dart';
import 'package:flutter/material.dart';

class BannerView extends StatelessWidget {
  const BannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorPalette.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Special Sale",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Up to 20%",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),

                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.amber,
                    ),
                    onPressed: () => {},
                    child: Text("Shop now"),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: Image.asset('assets/adidas_banner.png')),
        ],
      ),
    );
  }
}
