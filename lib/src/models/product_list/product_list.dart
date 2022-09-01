import 'package:equatable/equatable.dart';

import 'rating.dart';

class ProductList extends Equatable {
	final int? id;
	final String? title;
	final double? price;
	final String? description;
	final String? category;
	final String? image;
	final Rating? rating;

	const ProductList({
		this.id, 
		this.title, 
		this.price, 
		this.description, 
		this.category, 
		this.image, 
		this.rating, 
	});

	factory ProductList.fromProductList(Map<String, dynamic> json) {
		return ProductList(
			id: json['id'] as int?,
			title: json['title'] as String?,
			price: (json['price'] as num?)?.toDouble(),
			description: json['description'] as String?,
			category: json['category'] as String?,
			image: json['image'] as String?,
			rating: json['rating'] == null
						? null
						: Rating.fromProductList(json['rating'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toProductList() => {
				'id': id,
				'title': title,
				'price': price,
				'description': description,
				'category': category,
				'image': image,
				'rating': rating?.toProductList(),
			};

	ProductList copyWith({
		int? id,
		String? title,
		double? price,
		String? description,
		String? category,
		String? image,
		Rating? rating,
	}) {
		return ProductList(
			id: id ?? this.id,
			title: title ?? this.title,
			price: price ?? this.price,
			description: description ?? this.description,
			category: category ?? this.category,
			image: image ?? this.image,
			rating: rating ?? this.rating,
		);
	}

	@override
	List<Object?> get props {
		return [
				id,
				title,
				price,
				description,
				category,
				image,
				rating,
		];
	}
}
