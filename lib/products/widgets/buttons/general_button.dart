import 'package:flutter/material.dart';
import 'package:kaybul_app/products/utilities/padding/project_padding.dart';
import 'package:kaybul_app/products/widgets/texts/general_text.dart';

final class GeneralButton extends ElevatedButton {
  GeneralButton({super.key, required super.onPressed, required String title, required BuildContext context})
      : super(
          child: Padding(
            padding: ProjectPadding.allNormal(context),
            child: GeneralText(title, context: context),
          ),
        );
}
