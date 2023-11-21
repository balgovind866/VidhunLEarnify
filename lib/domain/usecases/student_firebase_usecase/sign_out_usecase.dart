

import '../../repository/firebase_repostory.dart';

class SignOutUseCase {
  final StudentFirebaseRepository repository;

  SignOutUseCase({required this.repository});

  Future<void> call()async{
    return repository.signOut();
  }
}