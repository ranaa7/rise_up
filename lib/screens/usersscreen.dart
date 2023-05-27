import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:riseup_task/screens/adduserscreen.dart';
import 'package:riseup_task/screens/detailsscreen.dart';
import 'package:value_cubit/value_cubit.dart';



import '../cubit/cubitclass_cubit.dart';
import '../model/updatemodel.dart';

class UserListScreen extends StatelessWidget {
 UserListScreen({Key? key}) : super(key: key);
  var name = TextEditingController();

  var email = TextEditingController();

  var userId = TextEditingController();
  var gender= TextEditingController();
  var status = TextEditingController();
 final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<classCubit,classState>(
        builder: (context,state){
      var cubit=context.read<classCubit>();
      if (state is LoadingState) {
        return Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 10,

              ),
            )

           );
      }
      if (state is LoadedState) {
        return Scaffold(
          appBar: AppBar(backgroundColor: Colors.deepPurple[200],
            title: Text("User's list"), actions: [IconButton(onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => adduserscreen()));
            }, icon: Icon(Icons.add))
            ],),
          body: cubit.users == null ? CircularProgressIndicator() : ListView
              .builder(
              itemCount: cubit.users.length, itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                cubit.getUserDetail(cubit.users[index].id);
                Navigator.of(context).push(MaterialPageRoute(builder: (
                    context) => Detailscreen()));
              },
              child: Card(
                  color: Colors.deepPurple[50],
                  child: Row(children: [Expanded(
                    child: Column(children: [ ListTile(
                      title: Text(cubit.users[index].name),
                      subtitle: Text(cubit.users[index].email),
                    ),
                    ],),
                  ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.cyan[200], // background
                          onPrimary: Colors.purple, // foreground
                        ),
                        onPressed: () {
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => updateuserscreen( id: cubit.users[index].id)));
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) =>
                                Form(
                                  key: _formKey,
                                  child: AlertDialog(
                                    title: const Text('Update User'),
                                    content: Column(children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        controller: name,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please enter your name";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          hintText: ("Name"),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius
                                                .circular(10),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        controller: email,
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              !value.contains("@")) {
                                            return "Please enter your email contains @";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          hintText: ("Email"),

                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius
                                                .circular(10),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        controller: gender,
                                        validator: (value) {
                                          if (value!.isEmpty )
                                               {
                                            return "Please enter your gender";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          hintText: ("Gender"),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius
                                                .circular(10),
                                          ),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: status,
                                        validator: (value) {
                                          if (value!.isEmpty ) {
                                            return "Please enter your status ";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          hintText: ("Status"),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius
                                                .circular(10),
                                          ),
                                        ),
                                      ),


                                    ],),
                                    actions: <Widget>[
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.pink,
                                            // background
                                            onPrimary: Colors
                                                .purple, // foreground
                                          ),
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              cubit.updateUser(Updatemodel(
                                                  name: name.text,
                                                  email: email.text,
                                                  gender: gender.text,
                                                  status: status.text),
                                                  cubit.users[index].id);
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          UserListScreen()));
                                            }
                                          },
                                          child: Text(
                                            "Update user",
                                            style: TextStyle(
                                                color: Colors.black),

                                          )),

                                    ],
                                  ),
                                ),
                          );
                        },
                        child: Icon(Icons.edit)),
                    SizedBox(width: 10,),
                    ElevatedButton(

                        style: ElevatedButton.styleFrom(
                          primary: Colors.pink[300], // background
                          onPrimary: Colors.purple, // foreground

                        ),
                        onPressed: () {
                          cubit.deleteUser(cubit.users[index].id);
                        },
                        child: Icon(Icons.delete)
                    ),
                  ],)

              ),
            );
          }),


        );
      }
      else return Container();
    });
  }
}
