import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmilyPainter extends CustomPainter {
  SmilyPainter({required this.FaceColor});
  final Color FaceColor;
  @override
  void paint(Canvas canvas, Size size) {
    var width = size.width;
    var height = size.height;
    final Radius = min(width, height) / 2;
    final CenterOffset = Offset(width / 2, height / 2);
    final EyeRadius = Radius * 0.17;
    final LeftEyeBallRadius = EyeRadius * 0.25;
    final RightEyeBallRadius = EyeRadius * 0.25;
    final EyeOffsetLocation = Radius * 0.45;
    final EyeBallOffSetLocation = Radius * 0.42;
    final MouthRadius = Radius * 0.40;
    final teethRadius = MouthRadius * 0.25;

    final TeethOffSetLocation =
        Offset(CenterOffset.dx+MouthRadius*0.25, CenterOffset.dy + EyeOffsetLocation * 0.40);
        final TeethOffSetLocation1 =
        Offset(CenterOffset.dx+MouthRadius*-0.25, CenterOffset.dy + EyeOffsetLocation * 0.40);
    final MouthOffSetLocation =
        Offset(CenterOffset.dx, CenterOffset.dy + EyeOffsetLocation * 0.40);

    final LeftEyeBall = Offset(CenterOffset.dx - EyeBallOffSetLocation,
        CenterOffset.dy - EyeBallOffSetLocation);
    final RightEyeBall = Offset(CenterOffset.dx + EyeBallOffSetLocation,
        CenterOffset.dy - EyeBallOffSetLocation);

    final LeftEyeOffset = Offset(CenterOffset.dx - EyeOffsetLocation,
        CenterOffset.dy - EyeOffsetLocation);
    final RightEyeOffset = Offset(CenterOffset.dx + EyeOffsetLocation,
        CenterOffset.dy - EyeOffsetLocation);
    
    Paint FacePaint = Paint()..color =FaceColor;
    Paint EyePaint = Paint()..color = Colors.black;
    Paint EyeBall = Paint()..color = Colors.white;
    Paint MouthPaint = Paint()..color = Colors.black;
    Paint teethpaint = Paint()..color = Colors.white;
    canvas.drawCircle(CenterOffset, Radius, FacePaint);
    canvas.drawCircle(LeftEyeOffset, EyeRadius, EyePaint);
    canvas.drawCircle(RightEyeOffset, EyeRadius, EyePaint);
    canvas.drawCircle(LeftEyeBall, LeftEyeBallRadius, EyeBall);
    canvas.drawCircle(RightEyeBall, RightEyeBallRadius, EyeBall);
    
    canvas.drawArc(
        Rect.fromCircle(center: MouthOffSetLocation, radius: MouthRadius),
        degToRadian(0),
        degToRadian(180),
        true,
        MouthPaint);
        canvas.drawArc(
        Rect.fromCircle(center: TeethOffSetLocation, radius: teethRadius),
        degToRadian(0),
        degToRadian(180),
        true,
        teethpaint);
         canvas.drawArc(
        Rect.fromCircle(center: TeethOffSetLocation1, radius: teethRadius),
        degToRadian(0),
        degToRadian(180),
        true,
        teethpaint);
  }

  double degToRadian(double deg) => deg * pi / 180;

  @override
  bool shouldRepaint(SmilyPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(SmilyPainter oldDelegate) => false;
}
