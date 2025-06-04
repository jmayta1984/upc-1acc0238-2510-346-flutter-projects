import 'package:demo/core/theme/color_palette.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            cursorColor: ColorPalette.primaryColor,
            decoration: InputDecoration(
              hintText: 'Search',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
              ),
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
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Your Special Sale",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          "Up to 20%",
                          style: TextStyle(fontSize: 16, color: Colors.white),
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
          ),
        ),
      ],
    );
  }
}
