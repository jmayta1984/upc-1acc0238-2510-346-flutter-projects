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
  final bool isFavorite;
  
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
    required this.isFavorite
  });

  Shoe copy({required bool isFavorite}) {
    return Shoe(
      id: id,
      name: name,
      brand: brand,
      image: image,
      price: price,
      description: description,
      rating: rating,
      sizes: sizes,
      category: category,
      isFavorite: isFavorite,
    );
  }
}

class ShoeSize {
  final String size;
  final int stock;

  ShoeSize({
    required this.size,
    required this.stock,
  });
  
}