import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class FileManager {
  FileManager({ImagePicker? imagePicker, FilePicker? filePicker})
      : _imagePicker = imagePicker ?? ImagePicker(),
        _filePicker = filePicker ?? FilePicker.platform;

  final ImagePicker _imagePicker;
  final FilePicker _filePicker;

  String getGeneratedFileName(String fileName) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final fileType = fileName.split('.').last;
    return '$timestamp.$fileType';
  }

  Future<(int, String)> getFileSize(
      {required String filepath, int decimals = 1}) async {
    var file = File(filepath);
    int bytes = await file.length();
    if (bytes <= 0) return (bytes, '0 B');
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
    var i = (math.log(bytes) / math.log(1024)).floor();
    return (
      bytes,
      '${(bytes / math.pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}'
    );
  }

  Future<XFile?> takeImage({
    required ImageSource source,
    int imageQuality = 50,
    CameraDevice cameraDevice = CameraDevice.rear,
  }) async {
    final XFile? pickedFile;
    switch (source) {
      case ImageSource.camera:
        pickedFile = await _imagePicker.pickImage(
          source: source,
          imageQuality: imageQuality,
          preferredCameraDevice: cameraDevice,
        );
      case ImageSource.gallery:
        pickedFile = await _imagePicker.pickMedia(
          imageQuality: imageQuality,
        );
    }
    return pickedFile;
  }

  Future<XFile?> pickFile() async {
    FilePickerResult? result = await _filePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'pdf', 'png'],
    );
    return result?.xFiles.first;
  }

  Future<String> saveXFileLocally({
    required String filePath,
    required String fileName,
  }) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/$fileName');
    await file.writeAsBytes(await XFile(filePath).readAsBytes());
    return file.path;
  }

  Future<String> cachedNetworkImage(List<int> bytes) async {
    String? imageExtension;
    if (bytes.length >= 4) {
      final magicNumber = bytes.sublist(0, 4);
      if (magicNumber[0] == 0xFF &&
          magicNumber[1] == 0xD8 &&
          magicNumber[2] == 0xFF) {
        imageExtension = 'jpg';
      } else if (magicNumber[0] == 0x89 &&
          magicNumber[1] == 0x50 &&
          magicNumber[2] == 0x4E &&
          magicNumber[3] == 0x47) {
        imageExtension = 'png';
      } else if (magicNumber[0] == 0x47 &&
          magicNumber[1] == 0x49 &&
          magicNumber[2] == 0x46) {
        imageExtension = 'gif';
      }
    }

    final Directory tempDir = await getTemporaryDirectory();
    final String filePath =
        '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.${imageExtension ?? 'jpg'}';
    File file = File(filePath);
    await file.writeAsBytes(bytes);
    return filePath;
  }

  Future<XFile?> loadLocalFile({
    required String fileName,
  }) async {
    // Get the application documents directory
    final Directory directory = await getApplicationDocumentsDirectory();
    // List all files in the directory
    List<FileSystemEntity> files = directory.listSync();

    for (FileSystemEntity file in files) {
      if (file is File) {
        if (path.basename(file.path) == fileName) {
          // Return the XFile object if the file name matches
          return XFile(file.path);
        }
      }
    }
    // Return null if the file is not found
    return null;
  }

  Future<bool> deleteLocalFile({
    required String fileName,
  }) async {
    // Get the application documents directory
    final Directory directory = await getApplicationDocumentsDirectory();
    // List all files in the directory
    List<FileSystemEntity> files = directory.listSync();

    for (FileSystemEntity file in files) {
      if (file is File) {
        if (path.basename(file.path) == fileName) {
          // Delete the file if the file name matches
          await file.delete();
          return true; // File successfully deleted
        }
      }
    }
    return false; // File not found
  }

  Future<Uint8List> getBytesFromAsset({
    required String path,
    required int iconWidth,
    required int iconHeight,
  }) async {
    final ByteData data = await rootBundle.load(path);

    final ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: iconWidth,
      targetHeight: iconHeight,
      allowUpscaling: false,
    );

    final ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
