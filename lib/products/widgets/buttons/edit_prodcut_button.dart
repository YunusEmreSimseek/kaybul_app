import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

final class EditProductButton extends IconButton {
  EditProductButton({super.key, required super.onPressed, required BuildContext context})
      : super(
          icon: Card(
              child: Padding(
            padding: context.padding.low,
            child: const Icon(Icons.edit),
          )),
        );
}
