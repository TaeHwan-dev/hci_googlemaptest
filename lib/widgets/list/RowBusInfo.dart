import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hci_googlemap/data/BusInfo.dart';
import 'package:hci_googlemap/widgets/buttons/CircleIconButton.dart';

class RowBusInfo extends StatelessWidget {
  const RowBusInfo({
    Key? key,
    required this.busInfo,
  }) : super(key: key);

  final BusInfo busInfo;

  @override
  Widget build(BuildContext context) {
    bool isOne = Random().nextBool();
    List<Widget> stopInfo = [];
    stopInfo.add(StopPoint(name: "춘천역", isEnd: false));
    stopInfo.add(line());
    stopInfo.add(StopPoint(name: "한림대학교 정류장", isEnd: true));

    if(!isOne) {
      stopInfo.insert(2, line());
      stopInfo.insert(2, StopPoint(name: "인성병원", isEnd: false));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Text("${busInfo.wait}분", style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 26)),
                    const SizedBox(width: 8),
                    Text(busInfo.time, style: const TextStyle(fontSize: 14)),
                  ],),
                  Row(children: [
                    const SizedBox(width: 6),
                    Text("도보 ${busInfo.walk}분 | 카드 ${busInfo.price}",
                        style: const TextStyle(
                            fontSize: 16, color: Colors.grey)),
                  ]),
                  Container(
                    height: 20,
                    child: CustomPaint(painter: DrawGraph(
                        walk: busInfo.walk, wait: busInfo.wait, isOne: isOne)),
                  )
                ],
              ),
            ),
            Column(children: [
              CircleIconButton(
                iconData: Icons.directions_bus,
                outlineColor: Colors.red,
                iconColor: Colors.red,
                radius: 48,
                onPressed: () {},
              ),
              const Text(
                  "알림", style: TextStyle(fontSize: 14, color: Colors.redAccent))
            ],)
          ],
        ),
        ...stopInfo,
        SizedBox(height: 8,)
      ],
    );
  }
  Widget line() {
    return Container(
      color: Colors.black54,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 2,
      height: 18,
    );
  }
}


class DrawGraph extends CustomPainter {
  late Paint _paint;
  late List<Offset> dashLine;
  final int walk;
  final int wait;

  late List<int> linePercents;
  late List<Offset> linearLine;

  DrawGraph({required this.walk, required this.wait, required bool isOne}) {
    _paint = Paint();
    _paint.color = Colors.grey; //dots color
    _paint.strokeWidth = 3; //dots thickness
    _paint.strokeCap = StrokeCap.round; //dots corner edges
    dashLine = [];
    for (int i = 0; i < 200; i += 6) {
      dashLine.add(Offset(i.toDouble(), 10));
    }
    linePercents = [];
    int sum = ((wait - walk) / wait * 100).round();
    if (isOne) {
      linePercents.add(sum);
    } else {
      linePercents.add(Random().nextInt(sum));
      linePercents.add(sum - linePercents[0]);
    }
    linearLine = [];
    int startPercent = 0;
    int maxPercent = ((wait - walk) / wait * 100).round();
    for (int linePercent in linePercents) {
      int start = Random().nextInt(100 - maxPercent - startPercent) +
          startPercent;
      startPercent = start + linePercent;
      maxPercent -= linePercent;

      linearLine.add(Offset(start * 2, 10));
      linearLine.add(Offset(startPercent * 2, 10));
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPoints(PointMode.points, dashLine, _paint);
    _paint.color = Colors.blueAccent;
    for (int i = 0; i < linearLine.length; i += 2) {
      canvas.drawLine(linearLine[i], linearLine[i + 1], _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class StopPoint extends StatelessWidget {
  StopPoint({required this.name, required this.isEnd});

  String name;
  bool isEnd;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ic(),
        const SizedBox(width: 4,),
        Text(name, style: TextStyle(fontSize: isEnd ? 11 : 13, color: isEnd ? Colors.black54 : Colors.black),)
      ],
    );
  }

  Widget ic() {
    return isEnd ?
    Container(
      width: 22,
      alignment: Alignment.center,
      child: CircleIconButton(
        onPressed: () {},
        fillColor: Colors.white,
        outlineColor: Colors.blueAccent,
        radius: 13.5,
      ),
    ) :
    CircleIconButton(
      onPressed: () {},
      iconData: Icons.directions_bus_sharp,
      fillColor: const Color(0xFF87ceeb),
      iconColor: Colors.black,
      radius: 22,
    );
  }
}