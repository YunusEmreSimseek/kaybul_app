import 'package:flutter/material.dart';
import 'package:kaybul_app/products/enums/icon_size.dart';

final class ImagePickerButton extends IconButton {
  ImagePickerButton({super.key, required super.onPressed})
      : super(
          icon: Icon(
            Icons.image,
            size: IconSize.high.value,
          ),
        );
}
