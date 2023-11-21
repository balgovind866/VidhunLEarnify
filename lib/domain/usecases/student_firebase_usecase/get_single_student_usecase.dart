

import '../../entity/student_entites.dart';
import '../../repository/firebase_repostory.dart';

class GetSingleStudentUsecase{
final StudentFirebaseRepository repository;

GetSingleStudentUsecase( {required this.repository});
Stream<List<StudentEntity>> call(String uid) {
  return repository.getSingleStudent(uid);
}

}
