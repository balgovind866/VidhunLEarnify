part of 'student_bloc_cubit.dart';

@immutable
abstract class StudentBlocState  extends Equatable{
  const StudentBlocState();
}

class StudentBlocInitial extends StudentBlocState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class StudentLoading extends StudentBlocState {
  @override
  List<Object> get props => [];
}

class StudentLoaded extends StudentBlocState {
  final List<StudentEntity> students;

  const StudentLoaded({required this.students});
  @override
  List<Object> get props => [students];
}


class StudentFailure extends StudentBlocState {
  @override
  List<Object> get props => [];
}
