import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:kaybul_app/features/home/view/home_view.dart';
import 'package:kaybul_app/features/login/view/login_view.dart';
import 'package:kaybul_app/features/register/view/register_view.dart';
import 'package:kaybul_app/products/services/login/login_service.dart';
import 'package:kaybul_app/products/utilities/mixins/base_view_mixin.dart';
import 'package:kaybul_app/products/utilities/states/user/user_cubit.dart';

mixin LoginMixin on State<LoginView>, BaseViewMixin<LoginView> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final ScrollController scrollController;
  late final ILoginService _loginService;

  final User? user = FirebaseAuth.instance.currentUser;

  void initControllers() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    scrollController = ScrollController();
    _loginService = LoginService();
  }

  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
    scrollController.dispose();
  }

  void navigateToRegisterView() {
    context.route.navigateToPage(const RegisterView());
  }

  void navigateToHomeView() {
    context.route.navigation.pushReplacement(MaterialPageRoute(builder: (context) => const HomeView()));
  }

  Future<void> login() async {
    changeLoading();
    final response = await _loginService.login(email: emailController.text, password: passwordController.text);
    if (response) {
      changeLoading();
      await getCubit<UserCubit>().fetchSignedInUserDetails(emailController.text);
      navigateToHomeView();
      return;
    }
    if (!response) {
      changeLoading();
    }
  }

  Future<void> chechUser() async {
    changeLoading();
    final response = _loginService.isLoggedIn(FirebaseAuth.instance.currentUser);
    if (response) {
      await getCubit<UserCubit>().fetchSignedInUserDetails(user!.email!);
      changeLoading();
      navigateToHomeView();
      return;
    }
    changeLoading();
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

  @override
  void initState() {
    super.initState();
    Future.microtask(() => chechUser());
    initControllers();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }
}
