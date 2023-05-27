import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:riseup_task/model/updatemodel.dart';
import 'package:riseup_task/model/usermodel.dart';

import '../model/errormodel.dart';

part 'cubitclass_state.dart';

class classCubit extends Cubit<classState> {
  List<Usermodel> users = [];

  classCubit() : super(classInitial()) {
    //getUsers();
    getUsersdata();
  }

  //static classCubit instance(context) => BlocProvider.of(context);
  Usermodel? usermodel;
  Updatemodel? updatemodel;

  get stateStream => null;


  Future getUsersdata() async {
    try {
      emit(LoadingState());
      Response? response = await Dio().get(
          "https://gorest.co.in/public/v2/users", options: Options(headers: {
        "Authorization": "Bearer 67a366eb7ed03292ff8db707d0f5cf33c72161f3c77247a53776c49b52031616"
      }));
      if (response.statusCode == 200) {
        users =
        List<Usermodel>.from(response.data.map((e) => Usermodel.fromJson(e)));
        emit(LoadedState(users));
      }
    }
    on DioError catch (error) {
      ErrorModel errorModel = ErrorModel(
          message: error.response!.statusMessage!);
      emit(faileduserState(errorModel: errorModel));
    }
    // catch(e){
    //   print(e);
    // }

  }

  Future getUserDetail(int id) async {
    try {
    var response = await Dio().get("https://gorest.co.in/public/v2/users/$id",
        options: Options(headers: {
          "Authorization": "Bearer 67a366eb7ed03292ff8db707d0f5cf33c72161f3c77247a53776c49b52031616"
        }));
    if (response.statusCode == 200) {
      usermodel = Usermodel.fromJson(response.data);
      emit(SuccessdetailState());
      print(response.data);
   }
 }
    on DioError catch (error) {
      ErrorModel errorModel = ErrorModel(
          message: error.response!.statusMessage!);
      emit(faileddetailState(errorModel: errorModel));
    }
    // catch(e){
    //   print(e);
    // }
  }

  Future addUser(Usermodel user) async {
    try {
      var response = await Dio().post("https://gorest.co.in/public/v2/users",
          options: Options(headers: {
            "Authorization": "Bearer 67a366eb7ed03292ff8db707d0f5cf33c72161f3c77247a53776c49b52031616"
          }), data: user.toJson());
      if (response.statusCode == 200) {
        emit(SuccessaddedState());

        print(response.data);
      }
    }
    on DioError catch (error) {
      ErrorModel errorModel = ErrorModel(
          message: error.response!.statusMessage!);
      emit(failedaddedState(errorModel: errorModel));
    }

  }

  Future updateUser(Updatemodel update, int id) async {
    try {
      var response = await Dio().put("https://gorest.co.in/public/v2/users/$id",
          options: Options(headers: {
            "Authorization": "Bearer 67a366eb7ed03292ff8db707d0f5cf33c72161f3c77247a53776c49b52031616"
          }), data: update.toJson());
      if (response.statusCode == 200) {
        emit(SuccessupdatedState());
        print(response.data);
      }
    }
    on DioError catch (error) {
      ErrorModel errorModel = ErrorModel(
          message: error.response!.statusMessage!);
      emit(failedupdatedState(errorModel: errorModel));
    }

  }

  Future deleteUser(int id) async {
    try {
      var response = await Dio().delete(
          "https://gorest.co.in/public/v2/users/$id", options: Options(
          headers: {
            "Authorization": "Bearer 67a366eb7ed03292ff8db707d0f5cf33c72161f3c77247a53776c49b52031616"
          }));

      if (response.statusCode == 200) {
        emit(SuccessdeletedState());
        print(response.data);
      }
    }
    on DioError catch (error) {
      ErrorModel errorModel = ErrorModel(
          message: error.response!.statusMessage!);
      emit(failedupdatedState(errorModel: errorModel));
    }

  }







}
