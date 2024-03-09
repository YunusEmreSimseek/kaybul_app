import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaybul_app/products/services/hive/hive_service.dart';
import 'package:kaybul_app/products/services/product/product_service.dart';
import 'package:kaybul_app/products/utilities/states/base/base_state.dart';
import 'package:kaybul_app/products/view_models/product_view_model.dart';
import 'package:logger/logger.dart';

part 'product_state.dart';

final class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductState());
  final IProductService _productService = ProductService();
  final IHiveService _hiveService = HiveService();

  Future<void> fetchProducts(String? id) async {
    List<ProductViewModel> productView = [];
    if (id == null) return;
    final response = await _productService.fetchProducts(id);
    if (response == null) {
      emit(const ProductState());
      return;
    }
    for (var product in response) {
      final image = await _hiveService.getImageFromHive(product.api!);
      if (image != null) {
        final productViewModel = product.toProductViewModel(image);
        productView.add(productViewModel);
      }
      if (image == null) {
        Logger().e('Image is null');
        final productViewModel = product.toProductViewModel(image);
        productView.add(productViewModel);
      }
    }
    setProducts(productView);
  }

  void setProducts(List<ProductViewModel>? products) {
    emit(state.copyWith(products: products));
    changeUpdated();
  }

  void changeUpdated() {
    emit(state.copyWith(isUpdated: !state.isUpdated));
  }
}
