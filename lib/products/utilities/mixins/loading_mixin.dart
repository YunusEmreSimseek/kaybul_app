import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaybul_app/products/utilities/states/loading/loading_cubit.dart';

mixin LoadingMixin {
  void changeLoading({required BuildContext context}) {
    context.read<LoadingCubit>().changeLoading();
  }
}
