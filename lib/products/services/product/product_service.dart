import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kaybul_app/products/enums/firebase_collections.dart';
import 'package:kaybul_app/products/models/product_model.dart';

abstract class IProductService {
  Future<List<ProductModel>?>? fetchProducts(String ownerId);
  Future<bool> addProduct(ProductModel product);
  Future<void> updateProduct(ProductModel product);
  Future<void> deleteProduct(ProductModel product);
  CollectionReference<Object?> get _productCollectionReference => FirebaseCollections.product.reference;
}

final class ProductService extends IProductService {
  @override
  Future<List<ProductModel>?>? fetchProducts(String ownerId) async {
    final response = await _productCollectionReference
        .where('ownerId', isEqualTo: ownerId)
        .withConverter(
          fromFirestore: (snapshot, options) => ProductModel().fromFirebase(snapshot),
          toFirestore: (value, options) {
            return value.toJson();
          },
        )
        .get();
    if (response.docs.isNotEmpty) {
      final user = response.docs.map((e) => e.data()).toList();
      return user;
    }
    if (response.docs.isEmpty) {
      return null;
    }
    return null;
  }

  @override
  Future<bool> addProduct(ProductModel product) async {
    final response = await _productCollectionReference.add(product.toJson());
    final updatedProduct = product.copyWith(id: response.id);
    await _productCollectionReference.doc(response.id).update(updatedProduct.toJson());
    if (response.id.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Future<void> updateProduct(ProductModel product) async {
    await _productCollectionReference.doc(product.id).update(product.toJson());
  }

  @override
  Future<void> deleteProduct(ProductModel product) async {
    await _productCollectionReference.doc(product.id).delete();
  }
}
