import '../../entity/teacher_entities.dart';
import '../../repository/firebase_repostory.dart';

class CreateTeacherUseCase {
  final TeacherFirebaseRepository repository;

  CreateTeacherUseCase({required this.repository});

  Future<void> call(TeacherEntity teacher) {
    return repository.createTeacher(teacher);
  }
}
