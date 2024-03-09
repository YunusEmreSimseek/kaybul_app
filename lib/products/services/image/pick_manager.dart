import 'package:image_picker/image_picker.dart';

abstract class IPickManager {
  final IPickImageService pickImageService = PickImageService();
  Future<PickImageModel?> fetchMediaImage();
}

class PickManager extends IPickManager {
  @override
  Future<PickImageModel?> fetchMediaImage() async {
    final model = await pickImageService.pickImageFromGallery();
    return PickImageModel(file: model, status: true);
  }
}

class PickImageModel {
  PickImageModel({required this.file, this.status = false});

  final XFile? file;
  final bool status;
}

abstract class IPickImageService {
  Future<XFile?> pickImageFromGallery();
}

class PickImageService implements IPickImageService {
  final ImagePicker _picker = ImagePicker();
  @override
  Future<XFile?> pickImageFromGallery() => _picker.pickImage(source: ImageSource.gallery);
}
