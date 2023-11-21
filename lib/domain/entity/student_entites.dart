import 'package:equatable/equatable.dart';

class StudentEntity extends Equatable{
  final String? password; // Unique identifier for the student
  final String? fullName; // Full name of the student
  final int? age; // Age of the student
  final String? email; // Email address of the student
  final String? profileImageUrl; // URL to the student's profile image
  final String? rollNumber; // Roll number of the student
  final String? course;
  final String? uid;// Course in which the student is enrolled

  StudentEntity({
    this.uid,
     this.password,
     this.fullName,
     this.age,
    this.email,
     this.profileImageUrl,
     this.rollNumber,
     this.course,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    password,
    email,
    fullName,
    age,
    uid,
    profileImageUrl,
    rollNumber,
    course,
  ];
}