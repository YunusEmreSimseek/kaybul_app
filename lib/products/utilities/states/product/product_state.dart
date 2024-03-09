part of 'product_cubit.dart';

final class ProductState extends Equatable implements BaseState {
  const ProductState({this.products, this.isUpdated = false});
  final List<ProductViewModel>? products;
  final bool isUpdated;

  ProductState copyWith({List<ProductViewModel>? products, bool? isUpdated}) {
    return ProductState(
      products: products ?? this.products,
      isUpdated: isUpdated ?? this.isUpdated,
    );
  }

  @override
  List<Object?> get props => [products, isUpdated];
}
