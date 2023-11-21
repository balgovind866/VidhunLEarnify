

import '../../entity/student_entites.dart';
import '../../repository/firebase_repostory.dart';

class GetStudentUseCase {
  final StudentFirebaseRepository repository;



  GetStudentUseCase({required this.repository});

  Stream<List<StudentEntity>> call() {
    try {
      return repository.getStudents(); // Assuming you have a TeacherEntity object named 'teacher'
    } catch (e) {
      // Handle error and emit an error event through the stream
      return Stream.error(Exception('Failed to fetch teachers: $e'));
    }
  }
}