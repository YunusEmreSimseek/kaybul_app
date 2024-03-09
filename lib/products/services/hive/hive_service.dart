import 'dart:io';
import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kaybul_app/products/services/image/pick_manager.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

abstract class IHiveService {
  Future<Uint8List?> getImageFromHive(String id);
  Future<void> saveImageToHive({required File file, required String id});
  Future<void> pickImage(String id);
  final IPickManager pickManager = PickManager();
}

final class HiveService extends IHiveService {
  @override
  Future<Uint8List?> getImageFromHive(String id) async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final box = await Hive.openBox('images', path: appDocumentDir.path);
    final Uint8List? imageBytes = box.get(id);
    //await box.close();
    if (imageBytes != null) {
      return imageBytes;
    }
    return null;
  }

  @override
  Future<void> pickImage(String id) async {
    final model = await pickManager.fetchMediaImage();
    if (model!.file != null) {
      final XFile image = model.file!;
      final File file = File(image.path);

      await saveImageToHive(file: file, id: id);
    }
  }

  @override
  Future<void> saveImageToHive({required File file, required String id}) async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final box = await Hive.openBox('images', path: appDocumentDir.path);
    final Uint8List imageBytes = await file.readAsBytes();
    await box.put(id, imageBytes);
    await box.close();
    Logger().e('Image is saved to hive');
  }
}
