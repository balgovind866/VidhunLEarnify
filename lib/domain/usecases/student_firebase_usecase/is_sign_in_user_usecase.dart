

import '../../repository/firebase_repostory.dart';

class IsSignInUseCase {

  final StudentFirebaseRepository repository;

  IsSignInUseCase({required this.repository});

  Future<bool> call()async{
    return repository.isSignIn();
  }
}