part of 'credencial_cubit.dart';

abstract class CredencialState extends Equatable {
  const CredencialState();
}

class CredencialInitial extends CredencialState {
  @override
  List<Object> get props => [];

}
class CredentialInitial extends CredencialState {
  @override
  List<Object> get props => [];
}
class CredentialLoading extends CredencialState {
  @override
  List<Object> get props => [];
}
class CredentialSuccess extends CredencialState {
  @override
  List<Object> get props => [];
}
class CredentialFailure extends CredencialState {
  @override
  List<Object> get props => [];
}
