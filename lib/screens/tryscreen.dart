// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:riseup_task/model/usermodel.dart';
// import 'package:riseup_task/screens/usersscreen.dart';
//
// import '../../cubit/cubitclass_cubit.dart';
//
// class tryscreen extends StatelessWidget {
//   tryscreen({Key? key}) : super(key: key);
//
//   final name = TextEditingController();
//   final email = TextEditingController();
//   final userId = TextEditingController();
//   final gender = TextEditingController();
//   final status = TextEditingController();
//   final controller = StreamController();
//   @override
//   Widget build(BuildContext context) {
//     final cubit = context.read<classCubit>();
//     return Scaffold(
//         appBar: AppBar(
//         backgroundColor: Colors.deepPurple[200],
//         title: const Text("Comments screen"),
//     ),
//     body: StreamBuilder(
//     stream: controller.stream,
//     builder: (context, snapshot) {
//     if (snapshot.hasError) {
//     return const Text('Something went wrong!');
//     }
//     if (snapshot.connectionState == ConnectionState.waiting) {
//     return const Center(child: CircularProgressIndicator());
//     }
//      if(snapshot.hasData){
//     return Stack(
//     children: [
//     Container(
//     decoration: BoxDecoration(
//     gradient: LinearGradient(
//     begin: AlignmentDirectional.topStart,
//     end: AlignmentDirectional.bottomEnd,
//     colors: [
//     Colors.cyan.shade100,
//     Colors.deepPurple.shade100,
//     ],
//     ),
//     ),
//     child: Column(
//     children: [
//     const SizedBox(
//     height: 10,
//     ),
//     TextFormField(
//     controller: name,
//     decoration: const InputDecoration(
//     hintText: "Name",
//     border: OutlineInputBorder(
//     borderRadius: BorderRadius.all(
//     Radius.circular(10),
//     ),
//     ),
//     ),
//     ),
//     const SizedBox(
//     height: 10,
//     ),
//     TextFormField(
//     controller: email,
//     decoration: const InputDecoration(
//     hintText: "Email",
//     border: OutlineInputBorder(
//     borderRadius: BorderRadius.all(
//     Radius.circular(10),
//     ),
//     ),
//     ),
//     ),
//     const SizedBox(
//     height: 10,
//     ),
//     TextFormField(
//     controller: userId,
//     decoration: const InputDecoration(
//     hintText: "User ID",
//     border: OutlineInputBorder(
//     borderRadius: BorderRadius.all(
//     Radius.circular(10),
//     ),
//     ),
//     ),
//     ),
//     TextFormField(
//     controller: gender,
//     decoration: const InputDecoration(
//     hintText: "Gender",
//     border: OutlineInputBorder(
//     borderRadius: BorderRadius.all(
//     Radius.circular(10),
//     ),
//     ),
//     ),
//     ),
//     TextFormField(
//     controller: status,
//     decoration: const InputDecoration(
//     hintText: "Status",
//     border: OutlineInputBorder(
//     borderRadius: BorderRadius.all(
//     Radius.circular(10),
//     ),
//     ),
//     ),
//     ),
//     ElevatedButton(
//     style: ElevatedButton.styleFrom(
//     primary: Colors.pink, // background
//     onPrimary: Colors.purple, // foreground
//     ),
//     onPressed: () async {
//     controller.sink.add(cubit.addUser(Usermodel(id: int.parse(userId.text), name: name.text, email: email.text, gender: gender.text, status: status.text)));
//     //cubit.addUser(Usermodel(id: int.parse(userId.text), name: name.text, email: email.text, gender: gender.text, status: status.text));
//     Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserListScreen()));
//     },
//     child: Text(
//     "Add new user",
//     style: TextStyle(color: Colors.black),
//
//     )),
//     ],
//     ),
//     )
//     ],);}}));
//     }
//   }
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riseup_task/model/usermodel.dart';
import 'package:riseup_task/screens/usersscreen.dart';

import '../../cubit/cubitclass_cubit.dart';

class tryscreen extends StatelessWidget {
  tryscreen({Key? key}) : super(key: key);

  final name = TextEditingController();
  final email = TextEditingController();
  final userId = TextEditingController();
  final gender = TextEditingController();
  final status = TextEditingController();
  final controller = StreamController.broadcast();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<classCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: const Text("Comments screen"),
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
        ],
      ),
    ),
    child: Column(
    children: [
    const SizedBox(
    height: 10,
    ),
    TextFormField(
    controller: name,
    decoration: const InputDecoration(
    hintText: "Name",

    border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
    Radius.circular(10),
    ),
    ),
    ),
    ),
    const SizedBox(
    height: 10,
    ),
    TextFormField(
    controller: email,
    decoration: const InputDecoration(
    hintText: "Email",
    border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
    Radius.circular(10),
    ),
    ),
    ),
    ),
    const SizedBox(
    height: 10,
    ),
    TextFormField(
    controller: userId,
    decoration: const InputDecoration(
    hintText: "User ID",
    border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
    Radius.circular(10),
    ),
    ),
    ),
    ),
    TextFormField(
    controller: gender,
    decoration: const InputDecoration(
    hintText: "Gender",
    border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
    Radius.circular(10),
    ),
    ),
    ),
    ),
    TextFormField(
    controller: status,
    decoration: const InputDecoration(
    hintText: "Status",
    border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
    Radius.circular(10),
    ),
    ),
    ),
    ),
    ElevatedButton(
    style: ElevatedButton.styleFrom(
    primary: Colors.pink, // background
    onPrimary: Colors.purple, // foreground
    ),
    onPressed: () async {
    controller.sink.add(cubit.addUser(Usermodel(
    id: int.parse(userId.text),
    name: name.text,
    email: email.text,
    gender: gender.text,
    status: status.text)));
    //cubit.addUser(Usermodel(id: int.parse(userId.text), name: name.text, email: email.text, gender: gender.text, status: status.text));
    Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => UserListScreen()));
    },
    child: Text(
    "Add new user",
    style: TextStyle(color: Colors.black),
    ),
    ),
    ],
    ),
    ),
    StreamBuilder(
    stream: controller.stream,
    builder: (context, snapshot) {
    if (snapshot.hasError) {
    return const Text('Something went wrong!');
    }
    if (snapshot.connectionState == ConnectionState.waiting) {
    return const Center(child: CircularProgressIndicator());
    }
    return SizedBox.shrink();
    },
    ),
    ],
    ),
    );
    }
}