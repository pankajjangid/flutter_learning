import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_learning/counter_demo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterStateProvider = StateNotifierProvider<CounterDemo,int>((ref) {
  return CounterDemo();
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

    final count = ref.watch(counterStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("River pod Provider Demo"),
        actions: [
          IconButton(onPressed: (){
            ref.refresh(counterStateProvider);
            }, icon: Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: Text("$count",style: TextStyle(fontSize: 30),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        ref.read(counterStateProvider.notifier).increment();
        },
        child: Icon(Icons.add),
      ),
    );

  }
}
