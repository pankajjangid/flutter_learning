import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/bloc/internet/internet_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Internet Connectivity App Using Bloc"),),
      body: SafeArea(
          child: Center(child: BlocConsumer<InternetBloc, InternetState>(
            listener:  (context,state){
              if(state is InternetConnectedState){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Internet connected"),backgroundColor: Colors.green,));
              }
              else if(state is InternetDisconnectedState){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Internet Disconnected"),backgroundColor: Colors.red,));
              }
            },
            builder: (context, state) {
               if(state is InternetConnectedState) {
                 return  Text("Internet Connected");
               } else if (state is InternetDisconnectedState) {
                 return Text("Internet Disconnected");
               } else {
                 return Text("Loading ...");
               }
          },
          ),)),
    );
  }
}
