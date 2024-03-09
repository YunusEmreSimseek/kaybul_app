import 'package:flutter/material.dart';
import 'package:kaybul_app/products/enums/font_size.dart';
import 'package:kaybul_app/products/widgets/texts/general_text.dart';

final class TitleText extends GeneralText {
  TitleText(super.data, {super.key, required super.context, super.maxLines})
      : super(
          fontSize: FontSize.midHigh.value,
          fontWeight: FontWeight.w500,
        );
}
