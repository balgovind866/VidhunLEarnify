



import 'package:equatable/equatable.dart';

import '../../../../domain/entity/teacher_entities.dart';


abstract class TeacherState extends Equatable {
  const TeacherState();
}



class TeacherInitial extends TeacherState {
  @override
  List<Object> get props => [];
}

class TeacherLoading extends TeacherState {
  @override
  List<Object> get props => [];
}


class TeacherLoaded extends TeacherState {
  final List<TeacherEntity> teachers;

  const TeacherLoaded({required this.teachers});
  @override
  List<Object> get props => [teachers];
}


class TeacherFailure extends TeacherState {
  @override
  List<Object> get props => [];
}


