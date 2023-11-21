




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_deshboard/screens/persantation/teacher/bloc/teacher_state.dart';

import '../../../../domain/entity/teacher_entities.dart';
import '../../../../domain/usecases/teacher_firebase_ucecase/GetTeacherUseCase.dart';
import '../../../../domain/usecases/teacher_firebase_ucecase/create_teacher_usecase.dart';
import '../../../../domain/usecases/upload_teacher_image_usecase.dart';


class TeacherCubit extends Cubit<TeacherState> {
  final CreateTeacherUseCase? createTeacherUseCase;
  final UploadImageToStorageUseCase uploadTeacherImageUseCase;
  final GetTeacherUseCase getTeacherUseCase;


  TeacherCubit( {
    required this.getTeacherUseCase,
    required this.createTeacherUseCase,
    required this.uploadTeacherImageUseCase,

  }) : super(TeacherInitial());

  Future<void> createTeacher({required TeacherEntity teacher}) async {
    try {
      await createTeacherUseCase!.call(teacher);
    } on FirebaseException catch(_) {
      emit(TeacherFailure());
    } catch (_) {
      emit(TeacherFailure());
    }
  }
  Future<void> getTeacher() async{
    print('it is call');
     emit(TeacherLoading());
     final streamResponse=getTeacherUseCase.call();
     streamResponse.listen((event) {
       emit(TeacherLoaded(teachers: event));

     });
  }



  Future<String> uploadImage({required Uint8List filePath, required String storagePath}) async {
    return await uploadTeacherImageUseCase.call(filePath, storagePath);
  }

}