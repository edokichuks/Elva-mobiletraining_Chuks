class Product {
  late final int? pId;
  late final String pTitle;
  late final double? pPrice;
  late final String pDescription;
  late final String pImagePath;
  late final String? pCategory;
  // late final Map pRating;
  late final Rating rate;

  /// {
  /// "id": 2,
  /// "title": "Mens Casual Premium Slim Fit T-Shirts ",
  /// "price": 22.3,
  /// "description": "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.",
  /// "category": "men's clothing",
  /// "image": "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
  /// "rating": {
  /// "rate": 4.1,
  /// "count": 259
  /// }
  /// }

  Product({
    required this.pId,
    required this.pTitle,
    this.pPrice,
    this.pDescription = '',
    required this.pImagePath,
    this.pCategory = '',
    // required this.pRating,
    required this.rate,
  });

  Product.fromJson(
    Map<String, dynamic> json,
  ) {
    pId = json['id'];
    pTitle = json['title'];
    pPrice = json['price'];
    pDescription = json['description'];
    pCategory = json['category'];
    pImagePath = json['image'];
//    pRating = json['rating'];

    rate = Rating.fromJson(json["rating"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = pId;
    data['title'] = pTitle;
    data['price'] = pPrice;
    data['description'] = pDescription;
    data['category'] = pCategory;
    data['image'] = pImagePath;
    //  data['rating'] = pRating;
    data['rating']['rate'] = rate;

    return data;
  }
}

class Rating {
  final int count;
  final double rate;

  Rating({
    required this.count,
    required this.rate,
  });
  factory Rating.fromJson(
    Map<String, dynamic> json,
  ) {
    return Rating(
      count: json['count'],
      rate: json['rate'],
    );
  }
}
