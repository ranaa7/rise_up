

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/cubitclass_cubit.dart';
import '../model/updatemodel.dart';

class Detailscreen extends StatelessWidget {
  Detailscreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<classCubit, classState>(builder: (context, state) {
      var cubit1 = context.read<classCubit>();
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.cyan,
            title: Text("Welcome, user details"),
          ),
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: AlignmentDirectional.topStart,
                        end: AlignmentDirectional.bottomEnd,
                        colors: [
                          Colors.cyan.shade100,
                          Colors.deepPurple.shade300,
                          Colors.cyan.shade100
                        ])),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Text("Name: ",
                          style:  TextStyle(color: Colors.black,fontSize: 25)),
                        Text(cubit1.usermodel?.name?? "",
                            style:  TextStyle(color: Colors.black,fontSize: 20)),
                      SizedBox(height: 10,),
                      Text("Email: ",
                          style:  TextStyle(color: Colors.black,fontSize: 25)),
                      Text(cubit1.usermodel?.email?? "",
                          style: TextStyle(color: Colors.black,fontSize: 20)),
                      SizedBox(height: 10,),
                      Text("Gender: ",
                          style:  TextStyle(color: Colors.black,fontSize: 25)),
                      Text(cubit1.usermodel?.gender?? "",
                          style: TextStyle(color: Colors.black,fontSize: 20)),
                      SizedBox(height: 10,),
                      Text("Status: ",
                          style:  TextStyle(color: Colors.black,fontSize: 25)),
                      Text(cubit1.usermodel?.status?? "",
                          style: TextStyle(color: Colors.black,fontSize: 20)),


                    ],
                  ),
                ),
              )
            ],
          ));
    });
  }
}




