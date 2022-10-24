import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:provider/provider.dart';

import '../provider/countProvider.dart';
import '../utils/count.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page Two")),
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