

import '../../entity/student_entites.dart';
import '../../repository/firebase_repostory.dart';

class CreateStudentUseCase {
  final StudentFirebaseRepository repository;

  CreateStudentUseCase({required this.repository});


  Future<void> call(StudentEntity student) {
    return repository.createStudent(student);
  }
}