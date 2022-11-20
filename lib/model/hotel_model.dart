class HotelModel {
  final String imagePath;
  final String title;
  final String location;
  final double ratingScore;
  final double price;

  const HotelModel({
    required this.imagePath,
    required this.title,
    required this.location,
    this.ratingScore = 0,
    required this.price,
  });
}

const mockListHotels = [
  HotelModel(
      imagePath: 'assets/image/thumbnail1.png',
      title: 'D`Omah Hotel Yogya',
      location: 'Bantul Regency, Yogyakarta',
      ratingScore: 4.25,
      price: 458),
  HotelModel(
      imagePath: 'assets/image/thumbnail2.png',
      title: 'Greenhost Boutique Hotel',
      location: 'Bantul Regency, Yogyakarta',
      ratingScore: 3.6,
      price: 338),
  HotelModel(
      imagePath: 'assets/image/thumbnail1.png',
      title: 'D`Omah Hotel Yogya',
      location: 'Bantul Regency, Yogyakarta',
      ratingScore: 2.6,
      price: 458),
  HotelModel(
      imagePath: 'assets/image/thumbnail2.png',
      title: 'Greenhost Boutique Hotel',
      location: 'Bantul Regency, Yogyakarta',
      ratingScore: 10,
      price: 338),
];
