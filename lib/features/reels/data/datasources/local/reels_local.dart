import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

abstract class ReelsLocal {
  Future<String> getLocalVideoPath({required String videoUrl});
  Future<String> cacheVideo({required String videoUrl});
}

class ReelsLocalImplements extends ReelsLocal {
  // Helper method to generate a SHA256 hash of the video URL
  String generateHash(String videoUrl) {
    final bytes = utf8.encode(videoUrl); // Convert the URL to bytes
    final hash = sha256.convert(bytes); // Generate the SHA256 hash
    return hash.toString(); // Return the hex representation of the hash
  }

  // Caches the reel video to local storage
  @override
  Future<String> cacheVideo({required String videoUrl}) async {
    final localPath = await getLocalVideoPath(videoUrl: videoUrl);

    // Check if the video is already cached locally to avoid re-downloading
    if (File(localPath).existsSync()) {
      return localPath; // Return cached video path if it exists
    }

    // If not cached, download the video and store it locally
    final response = await http.get(Uri.parse(videoUrl));

    if (response.statusCode == 200) {
      final file = File(localPath);
      await file
          .writeAsBytes(response.bodyBytes); // Save video to local storage
      return localPath;
    } else {
      throw Exception('Failed to download video');
    }
  }

  // Returns a unique local storage path for the video based on its URL
  @override
  Future<String> getLocalVideoPath({required String videoUrl}) async {
    final directory = await getTemporaryDirectory();

    // Use SHA256 hash to ensure a unique file name for each video URL
    final videoHash = generateHash(videoUrl);
    return '${directory.path}/$videoHash.mp4'; // Use the hash as the unique filename
  }
}
