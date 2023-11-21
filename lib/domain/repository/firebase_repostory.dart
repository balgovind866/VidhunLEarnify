import 'dart:io';
import 'dart:typed_data';


import '../entity/student_entites.dart';
import '../entity/teacher_entities.dart';

abstract class TeacherFirebaseRepository {

  // Teacher Features
  Stream<List<TeacherEntity>> getTeachers();
  Stream<List<TeacherEntity>> getSingleTeacher(String uid);
  Stream<List<TeacherEntity>> getSingleOtherTeacher(String otherUid);
  Future<void> createTeacher(TeacherEntity teacher);
  Future<void> updateTeacher(TeacherEntity teacher);

  // Upload Teacher Image
  Future<String> uploadImageToStorage(Uint8List filePath, String storagePath);
}

abstract class StudentFirebaseRepository {

  // Student Features
  Stream<List<StudentEntity>> getStudents();
  Stream<List<StudentEntity>> getSingleStudent(String uid);
  Stream<List<StudentEntity>> getSingleOtherStudent(String otherUid);
  Future<void> createStudent(StudentEntity student);
  Future<void> updateStudent(StudentEntity student);

  // Upload Student Image
  Future<String> uploadImageToStorage(Uint8List filePath, String storagePath);

  Future<void> forgotPassword(String email);


  Future<bool> isSignIn();
  Future<void> signIn(StudentEntity student);
  Future<void> signUp(StudentEntity student);

  Future<void> signOut();

  Future<String> getCurrentUId();
}