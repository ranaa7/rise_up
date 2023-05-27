part of 'cubitclass_cubit.dart';

@immutable
abstract class classState {

}

class classInitial extends classState {
  List<Object> get props =>[] ;
}

class SuccessuserState extends classState {}
class SuccessdetailState extends classState {}
class SuccessaddedState extends classState {}
class SuccessupdatedState extends classState {}
class SuccessdeletedState extends classState {}
class LoadingState extends classState {
  @override
  List<Object> get props => [];
}

class LoadedState extends classState {
  LoadedState(this.userslist);

  final List<Usermodel> userslist;

  @override
  List<Object> get props => [userslist];
}