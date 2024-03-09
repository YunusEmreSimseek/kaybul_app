import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:kaybul_app/features/home/view/home_view.dart';
import 'package:kaybul_app/features/login/view/login_view.dart';
import 'package:kaybul_app/features/register/view/register_view.dart';
import 'package:kaybul_app/products/models/user_model.dart';
import 'package:kaybul_app/products/services/register/register_service.dart';
import 'package:kaybul_app/products/utilities/mixins/base_view_mixin.dart';
import 'package:kaybul_app/products/utilities/states/user/user_cubit.dart';

mixin RegisterMixin on State<RegisterView>, BaseViewMixin<RegisterView> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController passwordConfirmController;
  late final TextEditingController nameController;
  late final ScrollController scrollController;
  late final GlobalKey<FormState> formKey;
  late final IRegisterService _registerService;

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
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmController = TextEditingController();
    nameController = TextEditingController();
    scrollController = ScrollController();
    formKey = GlobalKey();
    _registerService = RegisterService();
  }

  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    nameController.dispose();
    scrollController.dispose();
  }

  void navigateToLoginView() {
    context.route.navigateToPage(const LoginView());
  }

  void scrollToBottomOnKeyboardOpen() {
    if (context.general.isKeyBoardOpen) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
      );
    }
  }

  Future<void> register() async {
    changeLoading();
    if (formKey.currentState!.validate() && passwordController.text == passwordConfirmController.text) {
      UserModel user = UserModel(
        email: emailController.text,
        name: nameController.text,
        password: passwordController.text,
        phoneNo: '',
      );
      final response = await _registerService.register(user: user);
      if (response) {
        await safeOperation(() async {
          if (FirebaseAuth.instance.currentUser != null) {
            await _registerService.addIdIntoUser(email: FirebaseAuth.instance.currentUser!.email!);
          }
        });

        await getCubit<UserCubit>().fetchSignedInUserDetails(emailController.text);

        directSafeOperarion(() {
          context.route.navigateToPage(const HomeView());
        });
      }
    }
    changeLoading();
  }
}
