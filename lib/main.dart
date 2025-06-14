import 'package:flutter/material.dart';
import 'package:to_do_list/pages/home_page.dart';

void main() {
  runApp(
    const ToDo()
  );
}

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
