import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePcikerHelper {
  static Future<File?> pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    //pick image
    XFile? xfile = await imagePicker.pickImage(source: source);

    //convert to File
    File? file;
    if (xfile != null) {
      file = File(xfile.path);
    }
    return file;
  }
}
