import '../../repository/firebase_repostory.dart';


class GetCurrentUIDUseCase{
  final StudentFirebaseRepository repository;

  GetCurrentUIDUseCase({required this.repository});
  Future<String> call()async{
    return await repository.getCurrentUId();
  }
}