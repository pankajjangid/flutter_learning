
import 'package:flutter/material.dart';

class MovieProvider extends ChangeNotifier{

  var favMoviesList = [];

  addFav(index){
    favMoviesList.add(index);
    notifyListeners();
  }
  removeFav(index){
    favMoviesList.remove(index);
    notifyListeners();
  }
}