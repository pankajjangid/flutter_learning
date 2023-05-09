import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_learning/user_model.dart';

class ApiService{

   String BASE_URL = "https://reqres.in/api/users?page=1";

   Future<List<UserModel>?> getUserData() async {
     final dio = Dio();
     final response = await dio.get(BASE_URL);
     if(response.statusCode == 200){
       List result  = response.data['data'];
       print(response.data.toString());
       return result.map((e) => UserModel.fromJson(e)).toList();
     }else{
       throw Exception(response.statusMessage);
     }
   }
}