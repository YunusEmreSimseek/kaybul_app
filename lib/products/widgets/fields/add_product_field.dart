import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:kaybul_app/products/enums/font_size.dart';

final class ProductField extends TextField {
  ProductField({super.key, required TextEditingController controller, required BuildContext context})
      : super(
          style: context.general.textTheme.titleMedium?.copyWith(fontSize: FontSize.lowMid.value),
          controller: controller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.all(context.border.normalRadius)),
          ),
        );
}
