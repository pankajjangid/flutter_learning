import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var countProvider = StateProvider<int>((ref){
  return 0;
});

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Riverpod Demo",
      theme: ThemeData(primarySwatch: Colors.green),
      home: Home(),
    );
  }
}
// using stateful widget

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    var count = ref.watch(countProvider);

    ref.listen(countProvider, (previous, next) {
      if(next ==5){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("The counter value is $next")));
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("River pod Provider Demo"),
        actions: [
          IconButton(onPressed: (){
         //   ref.invalidate(countProvider);
            ref.refresh(countProvider);
          }, icon: Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: Text("$count",style: TextStyle(fontSize: 30),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
         // ref.read(countProvider.notifier).update((state) => state+1);
          ref.read(countProvider.notifier).state ++;
        },
        child: Icon(Icons.add),
      ),
    );

  }
}
