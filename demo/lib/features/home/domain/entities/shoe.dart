class Shoe { 
  final int id;
  final String name;
  final String brand;
  final String image;
  final int price; 
  final String description;
  final double rating;
  final List<ShoeSize> sizes;
  final String category;
  
  const Shoe({
    required this.id,
    required this.name,
    required this.brand,
    required this.image,
    required this.price,
    required this.description,
    required this.rating,
    required this.sizes,
    required this.category,
  });
}

class ShoeSize {
  final String size;
  final int stock;

  ShoeSize({
    required this.size,
    required this.stock,
  });
  
}