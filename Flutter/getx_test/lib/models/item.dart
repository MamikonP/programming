class Item {
  final String imageUrl;
  final String name;
  final String size;
  final num price;

  Item({
    required this.imageUrl,
    required this.name,
    required this.size,
    required this.price,
  });

  static List<Item> generateItems() {
    const String imagePath = "assets/images/";
    return [
      Item(
          imageUrl: "${imagePath}apple_watch.jpeg",
          name: "Apple watch",
          size: "44",
          price: 150),
      Item(
          imageUrl: "${imagePath}jacket-blue.png",
          name: "Blue jacket",
          size: "M",
          price: 76),
      Item(
          imageUrl: "${imagePath}jeans.jpeg",
          name: "Jeans",
          size: "32",
          price: 28.15),
      Item(
          imageUrl: "${imagePath}boots.webp",
          name: "Boots Nike",
          size: "41",
          price: 84),
    ];
  }
}
