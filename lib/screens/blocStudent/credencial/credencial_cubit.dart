import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/usecases/student_firebase_usecase/create_student_usecase.dart';
import '../../../../domain/usecases/student_firebase_usecase/sign_in_usecase.dart';
import '../../../../domain/usecases/student_firebase_usecase/sign_up_usecase.dart';
import '../../../domain/entity/student_entites.dart';

part 'credencial_state.dart';

class CredencialCubit extends Cubit<CredencialState> {
  CredencialCubit() : super(CredencialInitial());
}
class CredentialCubit extends Cubit<CredencialState> {
  final SignUpUseCase signUpUseCase;
  final SignInUseCase signInUseCase;
  final CreateStudentUseCase createStudentUseCase;




  CredentialCubit(
      {

        required this.signUpUseCase,
        required this.signInUseCase,
       required this.createStudentUseCase,

      })
      : super(CredentialInitial());

/*  Future<void> forgotPassword({required String email}) async {
    try {
      await forgotPasswordUseCase.call(email);
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }*/

  Future<void> signInSubmit({
    required String email,
    required String password,
  }) async {
    emit(CredentialLoading());
    try {
      await signInUseCase.call(StudentEntity(email: email, password: password));
      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  /*Future<void> googleAuthSubmit() async {
    emit(CredentialLoading());
    try {
      await googleSignInUseCase.call();
      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }*/

  Future<void> signUpSubmit({required StudentEntity student}) async {
    emit(CredentialLoading());
    try {
      await signUpUseCase.call(StudentEntity(email: student.email, password: student.password));
      print('hello sing up');
      await createStudentUseCase.call(student);
      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

}