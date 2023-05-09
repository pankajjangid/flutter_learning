import 'package:flutter/material.dart';
import 'package:flutter_learning/api_service.dart';
import 'package:flutter_learning/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiProvider = Provider((ref) {
  return ApiService();
});

final userDataProvider = FutureProvider<List<UserModel>?>((ref) async {
  return ref.read(apiProvider).getUserData();
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
    final userData = ref.watch(userDataProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text("River pod Provider Demo"),
          actions: [IconButton(onPressed: () {
            ref.invalidate(userDataProvider);
          }, icon: Icon(Icons.refresh))],
        ),
        body: Container(
          child: userData.when(data: (data){
            return ListView.builder(itemBuilder: (context,index){
              return ListTile(title: Text("${data?[index].firstName}"),);
            },itemCount: data?.length ,);
          }, error: (error,stacktress){
            return Text(error.toString(),style: TextStyle(fontSize: 20),);
          }, loading: (){
            return Center(child: CircularProgressIndicator());
          }),
        ));
  }
}
