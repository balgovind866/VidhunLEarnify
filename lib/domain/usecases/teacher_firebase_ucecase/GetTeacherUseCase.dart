import '../../entity/teacher_entities.dart';
import '../../repository/firebase_repostory.dart';

class GetTeacherUseCase {
  final TeacherFirebaseRepository repository;

  GetTeacherUseCase({required this.repository});

  Stream<List<TeacherEntity>> call() {
    try {
      return repository.getTeachers(); // Assuming you have a TeacherEntity object named 'teacher'
    } catch (e) {
      // Handle error and emit an error event through the stream
      return Stream.error(Exception('Failed to fetch teachers: $e'));
    }
  }
}