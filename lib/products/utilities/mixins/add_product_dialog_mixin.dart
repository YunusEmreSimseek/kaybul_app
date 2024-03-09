import 'package:flutter/material.dart';
import 'package:kaybul_app/products/models/product_model.dart';
import 'package:kaybul_app/products/services/hive/hive_service.dart';
import 'package:kaybul_app/products/services/product/product_service.dart';
import 'package:kaybul_app/products/utilities/mixins/base_view_mixin.dart';
import 'package:kaybul_app/products/utilities/states/user/user_cubit.dart';
import 'package:kaybul_app/products/widgets/dialogs/add_product_dialog.dart';
import 'package:kaybul_app/products/widgets/dialogs/error_dialog.dart';
import 'package:kaybul_app/products/widgets/dialogs/success_dialog.dart';
import 'package:logger/logger.dart';

mixin AddProductDialogMixin on State<AddProductDialog>, BaseViewMixin<AddProductDialog> {
  late final TextEditingController nameController;
  late final TextEditingController apiController;
  late final IProductService _productService;
  late final IHiveService _hiveService;

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
    nameController = TextEditingController();
    apiController = TextEditingController();
    _productService = ProductService();
    _hiveService = HiveService();
  }

  void disposeControllers() {
    nameController.dispose();
    apiController.dispose();
  }

  Future<void> addProduct() async {
    if (nameController.text.isNotEmpty && apiController.text.isNotEmpty) {
      final ProductModel product = ProductModel(
        title: nameController.text,
        api: apiController.text,
        ownerId: getCubit<UserCubit>().state.user!.id,
      );
      final response = await _productService.addProduct(product);
      if (response) {
        Logger().i('Product added');
        directSafeOperarion(() {
          Navigator.pop(context);
          const SuccessDialog().show(context);
        });
        return;
      }
      if (!response) {
        Logger().e('Product not added');
        directSafeOperarion(() {
          const ErrorDialog().show(context);
        });
        return;
      }
    }
  }

  Future<void> pickImage(String id) async {
    changeLoading();
    await _hiveService.pickImage(id);
    changeLoading();
  }
}
