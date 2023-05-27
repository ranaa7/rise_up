part of 'cubitclass_cubit.dart';

@immutable
abstract class classState {

}

class classInitial extends classState {
  List<Object> get props =>[] ;
}




class SuccessuserState extends classState {}
class faileduserState extends classState {
  final ErrorModel errorModel;

  faileduserState({required this.errorModel});
}





class SuccessdetailState extends classState {}
class faileddetailState extends classState {
  final ErrorModel errorModel;

  faileddetailState({required this.errorModel});
}




class SuccessaddedState extends classState {}
class failedaddedState extends classState {
  final ErrorModel errorModel;

  failedaddedState({required this.errorModel});
}




class SuccessupdatedState extends classState {}
class failedupdatedState extends classState {
  final ErrorModel errorModel;

  failedupdatedState({required this.errorModel});
}




class SuccessdeletedState extends classState {}
class faileddeletedState extends classState {
  final ErrorModel errorModel;

  faileddeletedState({required this.errorModel});
}




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