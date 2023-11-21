import 'package:flutter/foundation.dart';

import '../repository/firebase_repostory.dart';

class UploadImageToStorageUseCase {
  final TeacherFirebaseRepository repository;

  UploadImageToStorageUseCase({required this.repository});

  Future<String> call(Uint8List filePath, String storagePath) {
    return repository.uploadImageToStorage(filePath, storagePath);
  }
}