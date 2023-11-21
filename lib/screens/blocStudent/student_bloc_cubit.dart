import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


import '../../../domain/entity/student_entites.dart';
import '../../../domain/usecases/student_firebase_usecase/create_student_usecase.dart';
import '../../domain/usecases/student_firebase_usecase/GetStudentUseCAse.dart';
import '../../domain/usecases/student_firebase_usecase/get_single_student_usecase.dart';

part 'student_bloc_state.dart';

class StudentBlocCubit extends Cubit<StudentBlocState> {

  final CreateStudentUseCase createStudentUseCase;
  final GetStudentUseCase getStudentUseCase;
  final GetSingleStudentUsecase getSingleStudentUsecase;
  StudentBlocCubit( {required this.createStudentUseCase,required this.getStudentUseCase,
required this.getSingleStudentUsecase
  }) : super(StudentBlocInitial());

  Future<void> createStudent({required StudentEntity student} )async {
    try{
      await  createStudentUseCase.call(student);
    } on FirebaseException catch(_){
      emit(StudentFailure ());
    }catch (_) {
      emit(StudentFailure());
    }
  }
  Future<void> getStudentProfile(String uid) async {

    emit(StudentLoading());
    final streamresponse=getSingleStudentUsecase.call(uid);
    streamresponse.listen((event) {
      emit(StudentLoaded(students: event));
    });
  }


}
