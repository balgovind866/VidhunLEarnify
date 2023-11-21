

import '../../entity/student_entites.dart';
import '../../repository/firebase_repostory.dart';

class SignInUseCase{
  final StudentFirebaseRepository repository;

SignInUseCase({required this.repository});

Future<void> call(StudentEntity student){
  return repository.signIn(student);
}
}