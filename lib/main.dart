import 'package:flutter/material.dart';

import 'new_example.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Face Id',
      home: NewExample(),
    );
  }
}
