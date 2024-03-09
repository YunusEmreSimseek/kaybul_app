import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:kaybul_app/products/models/base_firebase_model.dart';
import 'package:kaybul_app/products/models/product_model.dart';

final class ProductViewModel with EquatableMixin, IdModel, BaseFirebaseModel<ProductViewModel> {
  final String? title;
  final String? ownerId;
  final String? api;
  final Uint8List? image;

  @override
  final String? id;
  ProductViewModel({
    this.title,
    this.ownerId,
    this.api,
    this.image,
    this.id,
  });

  @override
  List<Object?> get props => [title, ownerId, api, id, image];

  ProductViewModel copyWith({
    String? title,
    String? ownerId,
    String? api,
    Uint8List? image,
    String? id,
  }) {
    return ProductViewModel(
      title: title ?? this.title,
      ownerId: ownerId ?? this.ownerId,
      api: api ?? this.api,
      image: image ?? this.image,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'ownerId': ownerId,
      'api': api,
      'image': image,
      'id': id,
    };
  }

  @override
  ProductViewModel fromJson(Map<String, dynamic> json) {
    return ProductViewModel(
      title: json['title'] as String?,
      ownerId: json['ownerId'] as String?,
      api: json['api'] as String?,
      image: json['image'] as Uint8List?,
      id: json['id'] as String?,
    );
  }

  ProductModel toProductModel() {
    return ProductModel(
      title: title,
      ownerId: ownerId,
      api: api,
      id: id,
    );
  }
}
