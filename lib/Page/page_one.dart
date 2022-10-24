import 'package:flutter/material.dart';
import 'package:inter/Page/page_two.dart';
import 'package:inter/Page/setting.dart';

import '../provider/countProvider.dart';
import '../utils/count.dart';

import 'package:provider/provider.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello World"),
      actions: [
        TextButton(onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context) => PageTwo()));
        }, child: Text("Second Page",style: TextStyle(color: Colors.red),)),
         TextButton(onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context) => Setting()));
        }, child: Icon(Icons.settings,color: Colors.red,)),
      ],
      ),
      body: Center(
        child: Column(children:[
          Text("Count is ${context.watch<CountProvider>().count}"),
          TextButton(onPressed: (){
            setState(() {
              context.read<CountProvider>().increaseCount();
            });
          }, child: Text("Increase"))
        ]),
      ),
    );
  }
}