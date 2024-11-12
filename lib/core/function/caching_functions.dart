// Method to clear the cached videos
import 'dart:io';

import 'package:path_provider/path_provider.dart';

@override
Future<void> clearVideoCache() async {
  try {
    final directory = await getTemporaryDirectory();
    final tempDir = Directory(directory.path);

    // Get all files in the temp directory and delete them
    final files = tempDir.listSync();
    for (var file in files) {
      if (file is File) {
        await file.delete();
      }
    } 
  } catch (e) {
    //Handeling Other Exception
    throw ();
  }
}
