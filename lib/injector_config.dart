import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:student_deshboard/domain/usecases/student_firebase_usecase/get_single_student_usecase.dart';
import 'package:student_deshboard/screens/blocStudent/auth/auth_cubit.dart';
import 'package:student_deshboard/screens/blocStudent/credencial/credencial_cubit.dart';
import 'package:student_deshboard/screens/blocStudent/student_bloc_cubit.dart';
import 'package:student_deshboard/screens/persantation/teacher/bloc/teacher_cubit.dart';

import 'data/data_sources/remote_data/remote_data_source_impl.dart';
import 'data/data_sources/remote_data/remote_data_sources.dart';
import 'data/repositoty/firebase_repositry.dart';
import 'domain/repository/firebase_repostory.dart';
import 'domain/usecases/student_firebase_usecase/GetStudentUseCAse.dart';
import 'domain/usecases/student_firebase_usecase/create_student_usecase.dart';
import 'domain/usecases/student_firebase_usecase/get_current_uid_usecase.dart';
import 'domain/usecases/student_firebase_usecase/is_sign_in_user_usecase.dart';
import 'domain/usecases/student_firebase_usecase/sign_in_usecase.dart';
import 'domain/usecases/student_firebase_usecase/sign_out_usecase.dart';
import 'domain/usecases/student_firebase_usecase/sign_up_usecase.dart';
import 'domain/usecases/teacher_firebase_ucecase/GetTeacherUseCase.dart';
import 'domain/usecases/teacher_firebase_ucecase/create_teacher_usecase.dart';
import 'domain/usecases/upload_teacher_image_usecase.dart';



/// [Dependency Injection] a way of making a class
/// independent of its own dependencies.

final sl = GetIt.instance;

Future<void> init() async {


  ///  [registerFactory] method is used to register a
  ///  factory function that will be used to create
  ///  an instance of a specific type whenever it is requested.

  /// Cubits
  sl.registerFactory(() => TeacherCubit(
    createTeacherUseCase: sl.call(),
    uploadTeacherImageUseCase: sl.call(),
    getTeacherUseCase: sl.call(),


  ));

  sl.registerFactory(() => StudentBlocCubit(
      createStudentUseCase: sl.call(),
    getStudentUseCase: sl.call(),
    getSingleStudentUsecase: sl.call(),

  ));

  sl.registerFactory<AuthCubit>(() => AuthCubit(
    isSignInUseCase: sl.call(),
    signOutUseCase: sl.call(),
    getCurrentUIDUseCase: sl.call(),
  ));

  sl.registerFactory<CredentialCubit>(() => CredentialCubit(

    createStudentUseCase: sl.call(),
    signInUseCase: sl.call(),
    signUpUseCase: sl.call(),
  ));

  ///  [registerLazySingleton] which registers a singleton object that will be
  ///  lazily initialized the first time it is requested,
  ///  and will return the same instance on subsequent requests.


  /// UseCases
  sl.registerLazySingleton(() => CreateTeacherUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => UploadImageToStorageUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => GetTeacherUseCase(repository: sl.call()));

  sl.registerLazySingleton(() => CreateStudentUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => GetStudentUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => GetSingleStudentUsecase(repository: sl.call()));



  sl.registerLazySingleton<IsSignInUseCase>(() => IsSignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCurrentUIDUseCase>(() => GetCurrentUIDUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignOutUseCase>(() => SignOutUseCase(repository: sl.call()));

  sl.registerLazySingleton<SignInUseCase>(() => SignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(repository: sl.call()));


  /// Repository
  sl.registerLazySingleton<TeacherFirebaseRepository>(() => TeacherFirebaseRepositoryImpl(remoteDataSource: sl.call()));

  sl.registerLazySingleton<StudentFirebaseRepository>(() => StudentFirebaseRepositoryImpl(  RemoteDateSource: sl.call(),));



  /// Remote Data Source
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(firebaseFirestore: sl.call(), firebaseStorage: sl.call()));
  sl.registerLazySingleton<StudentRemoteDateSource>(() =>StudentRemoteDataSourceImpl(firebaseFirestore: sl.call(), firebaseStorage: sl.call(), auth: sl.call()));

  /// Firebase
  final firebaseFirestore = FirebaseFirestore.instance;
  final firebaseStorage = FirebaseStorage.instance;
  final firebaseAuth= FirebaseAuth.instance;

  sl.registerLazySingleton(() => firebaseFirestore);
  sl.registerLazySingleton(() => firebaseStorage);
  sl.registerLazySingleton(() => firebaseAuth);
}