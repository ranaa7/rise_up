import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:riseup_task/core/network_service.dart';
import 'package:riseup_task/model/updatemodel.dart';
import 'package:riseup_task/model/usermodel.dart';

part 'cubitclass_state.dart';

class classCubit extends Cubit<classState> {
  List<Usermodel> users =[];
  classCubit() : super(classInitial()){
    //getUsers();
    getUsersdata();
  }
  //static classCubit instance(context) => BlocProvider.of(context);
 Usermodel? usermodel;
  Updatemodel? updatemodel;

  get stateStream => null;

  Future getUsers() async{
    try {
      Response? response = await NetworkService.getUser(endPoint: "https://gorest.co.in/public/v2/users");
      if (response.statusCode == 200) {
        users = List<Usermodel>.from(response.data.map((e)=>Usermodel.fromJson(e)));
        emit(SuccessuserState());
      }
    }
    catch(e){
      print(e);
    }
  }


  Future getUsersdata() async{
    try {
      emit(LoadingState());
      Response? response = await Dio().get("https://gorest.co.in/public/v2/users",options: Options(headers: {"Authorization":"Bearer 67a366eb7ed03292ff8db707d0f5cf33c72161f3c77247a53776c49b52031616"}));
      if (response.statusCode == 200) {
        
        users = List<Usermodel>.from(response.data.map((e)=>Usermodel.fromJson(e)));
        emit(LoadedState(users));
      }
    }
    catch(e){
      print(e);
    }
  }
  Future getUserDetail(int id)async{
    var response = await Dio().get("https://gorest.co.in/public/v2/users/$id",options: Options(headers: {"Authorization":"Bearer 67a366eb7ed03292ff8db707d0f5cf33c72161f3c77247a53776c49b52031616"}));
    usermodel= Usermodel.fromJson(response.data);
    emit(SuccessdetailState());
    print(response.data);
  }

Future addUser(Usermodel user)async{
  var response = await Dio().post("https://gorest.co.in/public/v2/users",options: Options(headers: {"Authorization":"Bearer 67a366eb7ed03292ff8db707d0f5cf33c72161f3c77247a53776c49b52031616"}),data: user.toJson());
  emit(SuccessaddedState());
  print(response.data);
}
  Future updateUser(Updatemodel update, int id )async{
    var response = await Dio().put("https://gorest.co.in/public/v2/users/$id",options: Options(headers: {"Authorization":"Bearer 67a366eb7ed03292ff8db707d0f5cf33c72161f3c77247a53776c49b52031616"}),data: update.toJson());
    emit(SuccessupdatedState());
    print(response.data);
  }
  Future deleteUser(int id)async{
    var response = await Dio().delete("https://gorest.co.in/public/v2/users/$id",options: Options(headers: {"Authorization":"Bearer 67a366eb7ed03292ff8db707d0f5cf33c72161f3c77247a53776c49b52031616"}));
    emit(SuccessdeletedState());
    print(response.data);
  }

  // Future addUser(Usermodel user)async{
  //   var response = await NetworkService.postNewUser(endPoint: "https://gorest.co.in/public/v2/users", data: user.toJson());
  //   emit(SuccessaddedState());
  //   print(response.data);
  // }
  //
  // Future updateUser(Usermodel user,int id)async{
  //   var response = await NetworkService.updateUserData(endPoint: "https://gorest.co.in/public/v2/users/$id", data: user.toJson());
  //   emit(SuccessupdatedState());
  //   print(response.data);
  // }
  //
  // Future deleteUser(Usermodel user, int id)async{
  //   var response = await NetworkService.deleteUser(endPoint: "https://gorest.co.in/public/v2/users/$id", data: user.toJson());
  //   emit(SuccessdeletedState());
  //   print(response.data);
  // }


}
