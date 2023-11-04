import 'package:flutter/material.dart';
import 'package:ostad/screen/secondscreen.dart';

void main(){
  runApp(const Myapps());
}
class Myapps extends StatelessWidget {
  const Myapps({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Secondscreen(),
    );
  }
}




