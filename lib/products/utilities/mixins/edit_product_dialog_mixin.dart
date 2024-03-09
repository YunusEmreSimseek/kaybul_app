import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:kaybul_app/products/models/product_model.dart';
import 'package:kaybul_app/products/services/product/product_service.dart';
import 'package:kaybul_app/products/utilities/mixins/base_view_mixin.dart';
import 'package:kaybul_app/products/widgets/dialogs/edit_product_dialog.dart';
import 'package:kaybul_app/products/widgets/dialogs/success_dialog.dart';

mixin EditProductDialogMixin on State<EditProductDialog>, BaseViewMixin<EditProductDialog> {
  late final TextEditingController editNameController;
  late final IProductService _productService;

  Future<void> updateProduct({required String name, required ProductModel product}) async {
    final ProductModel updatedProduct = product.copyWith(title: name);
    safeOperation(() async => await _productService.updateProduct(updatedProduct));
    await context.route.pop();
    directSafeOperarion(() {
      const SuccessDialog().show(context);
    });
  }

  @override
  void initState() {
    super.initState();
    initControllers();
  }

  @override
  void dispose() {
    super.dispose();
    disposeControllers();
  }

  void initControllers() {
    editNameController = TextEditingController();
    _productService = ProductService();
  }

  void disposeControllers() {
    editNameController.dispose();
  }
}
