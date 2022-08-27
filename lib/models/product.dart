class Product {
  late final int? pId;
  late final String pTitle;
  late final double? pPrice;
  late final String pDescription;
  late final String pImagePath;
  late final String? pCategory;
  late final Map? pRating;
  late final Rating? rate;

  Product({
    required this.pId,
    required this.pTitle,
    this.pPrice,
    this.pDescription = '',
    required this.pImagePath,
    this.pCategory = '',
    this.pRating,
    this.rate,
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
    pRating = json['rating'];

    rate = Rating.fromJson(json['rate']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = pId;
    data['title'] = pTitle;
    data['price'] = pPrice;
    data['description'] = pDescription;
    data['category'] = pCategory;
    data['image'] = pImagePath;
    data['rating'] = pRating;
    data['rating']['rate'] = rate;

    return data;
  }
}

class Rating {
  final int count;
  final int rate;

  Rating({
    required this.count,
    required this.rate,
  });
  factory Rating.fromJson(
    Map<String, dynamic> json,
  ) {
    return Rating(count: json['count'], rate: json['rate']);
  }
}
