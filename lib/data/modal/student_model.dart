import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entity/student_entites.dart';

class StudentModel extends StudentEntity {
  final String? additionalProperty1;
  final String? additionalProperty2;
  final String? password ;
  final String? fullName;
  final int? age;
  final String? uid;

  final  String? email;
  final String? profileImageUrl;
  final String? rollNumber;
  final String? course;

  StudentModel({this.additionalProperty2,this.uid, this.profileImageUrl, this.rollNumber, this.course, this.additionalProperty1, this.password, this.fullName, this.age, this.email,



  }) : super(
    password: password,
    fullName: fullName,
    age: age,

    uid: uid,
    email: email,
    profileImageUrl: profileImageUrl,
    rollNumber: rollNumber,
    course: course,
  );

  factory StudentModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return StudentModel(
        password: snapshot['password'],
      fullName: snapshot['fullName'],
      age: snapshot['age'],
      email: snapshot['email'],
      profileImageUrl: snapshot['profileImageUrl'],
      rollNumber: snapshot['rollNumber'],
      course: snapshot['course'],
      uid: snapshot['uid'],
      additionalProperty1: snapshot['additionalProperty1'],
      additionalProperty2: snapshot['additionalProperty2'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid':uid,
      'password': password,
      'fullName': fullName,
      'age': age,
      'email': email,
      'profileImageUrl': profileImageUrl,
      'rollNumber': rollNumber,
      'course': course,
      'additionalProperty1': additionalProperty1,
      'additionalProperty2': additionalProperty2,
    };
  }
}