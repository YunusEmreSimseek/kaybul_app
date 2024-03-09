import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kaybul_app/products/services/image/pick_manager.dart';
import 'package:path_provider/path_provider.dart';

mixin ImagePickerMixin {
  String imageString = '';
  Future<void> pickImage(String id) async {
    final IPickManager pickManager = PickManager();
    final model = await pickManager.fetchMediaImage();
    if (model!.file != null) {
      final XFile image = model.file!;
      final File file = File(image.path);
      await saveImageToHive(file: file, id: id);
    }
  }

  Future<void> saveImageToHive({required File file, required String id}) async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final box = await Hive.openBox('images', path: appDocumentDir.path);
    final Uint8List imageBytes = await file.readAsBytes();
    await box.put(id, imageBytes);
    await box.close();
    print('Uint8List : $imageBytes');
    String base64String = base64Encode(imageBytes);
    imageString = base64String;
    print('String : $base64String');
    Uint8List newData = base64Decode(base64String);
    print('Uint8List : $newData');
  }

  Future<Uint8List?> getImageFromHive(String id) async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final box = await Hive.openBox(id, path: appDocumentDir.path);
    final Uint8List? imageBytes = box.get('imageDeneme');
    await box.close();

    if (imageBytes != null) {
      return imageBytes;
    }
    return null;
  }
}
