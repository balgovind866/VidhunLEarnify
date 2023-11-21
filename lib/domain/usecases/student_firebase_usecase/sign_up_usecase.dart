

import '../../entity/student_entites.dart';
import '../../repository/firebase_repostory.dart';

class SignUpUseCase{

  final StudentFirebaseRepository repository;
  SignUpUseCase({required this.repository});

  Future<void> call(StudentEntity student){
    return repository.signUp(student);
  }
}