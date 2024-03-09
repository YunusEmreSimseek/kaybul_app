// ignore_for_file: constant_identifier_names

enum Images {
  default_product,
  ;
}

extension ImagesExtension on Images {
  String toPath() => 'assets/images/img_$name.png';
}
