import 'package:flutter/material.dart';
import 'package:flutter_learning/provider/movie_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => MovieProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Learning",
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Movies(),
    );
  }
}

class Movies extends StatelessWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favMoviesList = context.watch<MovieProvider>().favMoviesList;
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Learning"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  "Movie $index",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                trailing: GestureDetector(
                    onTap: () {
                      /*
                        checking that fav data contain in the movies provider or not
                       */
                      if(favMoviesList.contains(index)){
                        context.read<MovieProvider>().removeFav(index);
                      }else{
                        context.read<MovieProvider>().addFav(index);
                      }
                    }, child: Icon(Icons.favorite,color: favMoviesList.contains(index) ? Colors.red : Colors.grey,)),
              );
            },
            itemCount: 40),
      ),
    );
  }
}
