import 'dart:async';

import 'package:custom_painter/painter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPainter(),
    );
  }
}

class MyPainter extends StatefulWidget {
  const MyPainter({Key? key}) : super(key: key);

  @override
  State<MyPainter> createState() => _MyPainterState();
}

class _MyPainterState extends State<MyPainter> {
  double swipe_Angle=0;
  double TimeLine=0;
  Color FaceColor=Colors.red;
   @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(seconds:1),
      (timer){
        setState((){
          if(TimeLine<1.0){
            FaceColor=Color.lerp(Colors.red,Colors.amber,TimeLine)!;
            TimeLine+=0.1;

          }else{
            TimeLine=0.0;
          }
        });
      }
    );
    
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Scaffold(body: Center(
      child: Expanded(
        flex: 10,
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints boxconstraints) {
              
          return Container(
           // color: Colors.red,
            
         
            width: boxconstraints.maxWidth,
                 height: boxconstraints.maxHeight,
             
              child: CustomPaint(
                painter: SmilyPainter(FaceColor:FaceColor),
              ));
        }),
      ),
    ));
  }
}
