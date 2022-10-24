

import 'package:flutter/material.dart';

import '../model/User.dart';
import '../utils/Api.dart';
import '../utils/ApiStatus.dart';

class UserProvider with ChangeNotifier{

  List<User> _users = [];
  bool _isLoading = true;
  bool _isError = false;
  String _errorMsg = "";

  List<User> get users  => _users;
  bool get isLoading  => _isLoading;
  bool get isError => _isError;
  String get errorMsg => _errorMsg;

  void setLoading(loading){
    _isLoading = loading;
  }

  void setError(errorCheck,errorMessage){
    _isError = errorCheck;
    _errorMsg = errorMessage;
  }

  void setUsers(List<User> users){
    _users = users;
  }

  void getUser() async{
    setLoading(true);
     Object resbody = await Api.get(url:"/user");
    print(resbody);
    if(resbody is Success){
      // print(resbody.response.toString());
      var listy = resbody.response as List;
      List<User> users = listy.map((e) => User.fromJson(e)).toList();
      setUsers(users);
    }
    if(resbody is Failure){
      setError(false, resbody.response.toString());
    }
    notifyListeners();
    setLoading(false);
  }
  
  
}