import 'package:flutter/material.dart';
import 'package:inter/model/User.dart';
import 'package:inter/provider/userProvider.dart';
import 'package:inter/utils/ApiStatus.dart';
import 'package:provider/provider.dart';

import '../provider/countProvider.dart';
import '../utils/Api.dart';

class Flash extends StatefulWidget {
  const Flash({Key? key}) : super(key: key);

  @override
  State<Flash> createState() => _FlashState();
}

class _FlashState extends State<Flash> {
  _loadApi() async{
    await Future.delayed(Duration(seconds: 5));
    context.read<UserProvider>().getUser();
    // context.read<CountProvider>().increaseCount();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MVVM")),
      body: _getContent(),
    );
  }

  Widget _getContent(){
    bool isLoading = context.watch<UserProvider>().isLoading;
    bool isError = context.watch<UserProvider>().isError;
    String errorMsg = context.watch<UserProvider>().errorMsg;
    List<User> users = context.watch<UserProvider>().users;

    if(isLoading){
      return Text("Loading....");
    }

    if(isError){
      return Text(errorMsg);
    }

    if(users.isEmpty){
      return Text("Users are Empty");
    }else{
      return Text("${users.length}");
    }
    return Text("show Page"
    );
    
  }
}