

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riseup_task/model/updatemodel.dart';
import 'package:riseup_task/model/usermodel.dart';
import 'package:riseup_task/screens/usersscreen.dart';

import '../../cubit/cubitclass_cubit.dart';

class adduserscreen extends StatelessWidget {
  adduserscreen ({Key? key}) : super(key: key);
  var name = TextEditingController();

  var email = TextEditingController();

  var userId = TextEditingController();
  var gender= TextEditingController();
  var status = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<classCubit, classState>(builder: (context, state) {
      var cubit = context.read<classCubit>();
      return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.deepPurple[200],
            title: Text("Comments screen"),
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
                      Colors.deepPurple.shade100,
                      Colors.cyan.shade100
                    ])),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: name,
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Please enter your name";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: ("Name"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: email,
                      validator: (value) {
                        if(value!.isEmpty || !value.contains("@")){
                          return "Please enter your email contains @";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: ("Email"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: userId,
                      decoration: InputDecoration(
                        hintText: ("user id"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: gender,
                      validator: (value) {
                        if(value!.isEmpty || !value.contains("male") || !value.contains("female")){
                          return "Please enter your gender (male or female)";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: ("Gender"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: status,
                      validator: (value) {
                        if(value!.isEmpty || !value.contains("active") || !value.contains("inactive")){
                          return "Please enter your status (active or inactive)";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: ("Status"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink, // background
                        onPrimary: Colors.purple, // foreground
                      ),
                      onPressed: () {
                        if(_formKey.currentState!.validate()) {
                          cubit.addUser(Usermodel(id: int.parse(userId.text), name: name.text, email: email.text, gender: gender.text, status: status.text));
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserListScreen()));
                        }

                      },
                      child: Text(
                        "Add new user",
                        style: TextStyle(color: Colors.black),

                      )),


                ],
              ),
            ),
          )
        ],
      ));
    });
  }
}
