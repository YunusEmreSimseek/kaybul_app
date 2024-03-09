import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaybul_app/products/utilities/states/obscure/obscure_cubit.dart';

mixin ObscureMixin {
  void changeObscure({required BuildContext context}) {
    context.read<ObscureCubit>().changeObscure();
  }
}
