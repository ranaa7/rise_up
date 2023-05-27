import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riseup_task/screens/adduserscreen.dart';
import 'package:riseup_task/screens/usersscreen.dart';

import 'cubit/cubitclass_cubit.dart';

void main() {
runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context)=> classCubit())
  ], child: MyApp(), ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserListScreen(),
    );
  }
}




