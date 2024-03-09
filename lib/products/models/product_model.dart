import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:kaybul_app/products/models/base_firebase_model.dart';
import 'package:kaybul_app/products/view_models/product_view_model.dart';

final class ProductModel with EquatableMixin, IdModel, BaseFirebaseModel<ProductModel> {
  final String? title;
  final String? ownerId;
  final String? api;

  @override
  final String? id;
  ProductModel({
    this.title,
    this.ownerId,
    this.api,
    this.id,
  });

  @override
  List<Object?> get props => [title, ownerId, api, id];

  ProductModel copyWith({
    String? title,
    String? ownerId,
    String? api,
    String? id,
  }) {
    return ProductModel(
      title: title ?? this.title,
      ownerId: ownerId ?? this.ownerId,
      api: api ?? this.api,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'ownerId': ownerId,
      'api': api,
      'id': id,
    };
  }

  @override
  ProductModel fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json['title'] as String?,
      ownerId: json['ownerId'] as String?,
      api: json['api'] as String?,
      id: json['id'] as String?,
    );
  }

  ProductViewModel toProductViewModel(Uint8List? image) {
    return ProductViewModel(
      title: title,
      ownerId: ownerId,
      api: api,
      image: image,
      id: id,
    );
  }
}
