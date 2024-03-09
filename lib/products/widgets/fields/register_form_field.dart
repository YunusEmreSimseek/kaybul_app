import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:kaybul_app/products/enums/font_size.dart';
import 'package:kaybul_app/products/enums/text_field_type.dart';
import 'package:kaybul_app/products/utilities/mixins/obscure_mixin.dart';
import 'package:kaybul_app/products/utilities/states/obscure/obscure_cubit.dart';

final class RegisterFormField extends StatelessWidget with ObscureMixin {
  const RegisterFormField({super.key, required this.controller, required this.type});
  final TextEditingController controller;
  final TextFieldType type;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ObscureCubit, ObscureState>(
      builder: (context, state) {
        return TextFormField(
          style: context.general.textTheme.titleMedium?.copyWith(fontSize: FontSize.lowMid.value),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => type.func == null ? null : type.func!(value),
          controller: controller,
          obscureText: type.isPassword ? state.isObscure : false,
          keyboardType: type.keyboardType,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.all(context.border.normalRadius)),
            hintText: type.hintText,
            prefixIcon: type.prefixIcon,
            suffix: type.isPassword
                ? InkWell(
                    onTap: () => changeObscure(context: context),
                    child: Icon(state.isObscure ? Icons.remove_red_eye : Icons.remove_red_eye_outlined),
                  )
                : null,
          ),
        );
      },
    );
  }
}
