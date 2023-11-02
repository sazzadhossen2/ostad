//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:ostad/screen/apihit.dart';
//
// class Showingpage extends StatefulWidget {
// final  Apihit showpage;
//    Showingpage( this.showpage);
//
//   @override
//   State<Showingpage> createState() => _ShowingpageState();
// }
//
// class _ShowingpageState extends State<Showingpage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
// Text(showpage.id.toString()),
//           Text(showpage.title.toString()),
//
//
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:ostad/screen/apihit.dart';

class Showingpage extends StatefulWidget {
  final Apihit showpage;

  Showingpage(this.showpage);

  @override
  State<Showingpage> createState() => _ShowingpageState();
}

class _ShowingpageState extends State<Showingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Showing Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ID: ${widget.showpage.id.toString()}'),
            Text('Title: ${widget.showpage.title.toString()}'),
          ],
        ),
      ),
    );
  }
}
