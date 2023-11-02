
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ostad/screen/apihit.dart';

class Secondpage extends StatefulWidget {
  final Apihit apihit;
  Secondpage(this.apihit);

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Photo Details"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: NetworkImage(
              widget.apihit.url.toString(),
            )),
            SizedBox(height: 20,),
            Text("title: ${widget.apihit.title.toString()}"),
            Center(child: Text("ID:${widget.apihit.id.toString()}")),
          ],
        ),
      ),

    );
  }
}
