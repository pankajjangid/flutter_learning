import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = Provider<String>((ref) {
  return "hello Pankaj";
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
    final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("River pod Provider Demo"),
      ),
      body: Center(
        child: Text(name),
      ),
    );
  }
}


// using Consumer
class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("River pod Provider Demo"),
      ),
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          final name = ref.watch(nameProvider);
          return Text(name);
        }),
      ),
    );
  }
}
/*

// using ConsumerWidget 

class MyHome extends ConsumerWidget{
  const MyHome({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    String name = ref.watch(nameProvider);
    return Scaffold(

      appBar: AppBar(title: Text(name),),
      body: Center(),
    );
  }
}
*/
