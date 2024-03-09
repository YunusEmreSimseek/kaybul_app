import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:kaybul_app/features/home/view/home_view.dart';
import 'package:kaybul_app/features/login/view/login_view.dart';
import 'package:kaybul_app/products/constants/string_constant.dart';
import 'package:kaybul_app/products/enums/firebase_collections.dart';
import 'package:kaybul_app/products/models/product_model.dart';
import 'package:kaybul_app/products/services/product/product_service.dart';
import 'package:kaybul_app/products/services/thingspeak/thingspeak_service.dart';
import 'package:kaybul_app/products/utilities/mixins/base_view_mixin.dart';
import 'package:kaybul_app/products/utilities/states/product/product_cubit.dart';
import 'package:kaybul_app/products/utilities/states/user/user_cubit.dart';
import 'package:kaybul_app/products/widgets/dialogs/edit_product_dialog.dart';
import 'package:kaybul_app/products/widgets/dialogs/success_dialog.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

mixin HomeMixin on State<HomeView>, BaseViewMixin<HomeView> {
  late final IThingSpeakService _thingSpeakService;
  late final IProductService _productService;
  Stream<QuerySnapshot>? stream;
  StreamSubscription? streamSubscription;

  Future<void> initAndListenStream() async {
    stream = FirebaseCollections.product.reference
        .where(StringConstant.queryOwnerId, isEqualTo: getCubit<UserCubit>().state.user?.id)
        .snapshots();
    if (stream != null) {
      streamSubscription = stream!.listen((event) async {
        await getCubit<ProductCubit>().fetchProducts(getCubit<UserCubit>().state.user?.id);
        Logger().i(StringConstant.loggerStreamIsListening);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initServices();
    initAndListenStream();
  }

  void initServices() {
    _thingSpeakService = ThingSpeakService();
    _productService = ProductService();
  }

  void navigateToLoginPage() {
    directSafeOperarion(() {
      context.route.navigation.pushReplacement(MaterialPageRoute(builder: (context) => const LoginView()));
    });
  }

  void editProduct(ProductModel product) {
    EditProductDialog.show(
      context: context,
      product: product,
    );
  }

  Future<void> deleteProduct(ProductModel product) async {
    safeOperation(() async => await _productService.deleteProduct(product));
    Navigator.pop(context);
    const SuccessDialog().show(context);
  }

  Future<void> getLocation(String? apiKey) async {
    if (apiKey == null) return;
    final response = await _thingSpeakService.fetchLocations(apiKey);
    if (response == null) {
      Logger().e(StringConstant.loggerCouldNotFetchLocations);
      return;
    }
    final stringUrl = 'https:${StringConstant.rootUrl}${response.field1},${response.field2}';
    final Uri url = Uri.parse(stringUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      Logger().e('${StringConstant.loggerCouldNotLaunchUrl} $url');
    }
  }
}
