import 'package:flutter/material.dart';
import 'package:hci_googlemap/data/BusInfo.dart';
import 'package:hci_googlemap/widgets/buttons/ElevatedIconButton.dart';
import 'package:hci_googlemap/widgets/list/RowBusInfo.dart';

class PathFinding extends StatefulWidget {
  bool resultVisible = false;

  @override
  State<StatefulWidget> createState() => PathFindingState();
}

class PathFindingState extends State<PathFinding> {
  List<BusInfo> busList = [
    BusInfo(wait: 20, time: "오후 3:14~3:34", walk: 7, price: "1,550"),
    BusInfo(wait: 23, time: "오후 3:17~3:40", walk: 5, price: "1,550"),
    BusInfo(wait: 31, time: "오후 3:40~4:11", walk: 20, price: "1,550"),
    BusInfo(wait: 27, time: "오후 3:40~4:11", walk: 12, price: "1,550"),
  ];

  @override
  Widget build(BuildContext context) {
    final initPath = ModalRoute.of(context)!.settings.arguments as String;
    if (initPath.isNotEmpty) {
      widget.resultVisible = true;
    }

    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new)),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                  child: Column(
                children: [
                  TextField(
                      controller: TextEditingController(text: "내 위치(한림대학교)"),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(horizontal: 18),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                      enabled: true,
                      autofocus: false,
                      controller: TextEditingController(text: initPath),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(horizontal: 18),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                      )),
                ],
              )),
              const SizedBox(
                width: 8,
              ),
              Column(
                children: const [
                  Icon(Icons.more_horiz),
                  SizedBox(
                    height: 12,
                  ),
                  Icon(Icons.swap_vert_sharp),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const Expanded(
                child: Icon(
                  Icons.directions_car,
                  size: 34,
                ),
              ),
              Expanded(
                  child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xFF87ceeb),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(14))),
                margin: const EdgeInsets.all(6),
                padding: const EdgeInsets.all(1),
                child: const Icon(Icons.directions_bus_sharp, size: 34),
              )),
              const Expanded(
                child: Icon(Icons.directions_walk, size: 34),
              ),
              const Expanded(
                child: Icon(Icons.pedal_bike, size: 34),
              ),
            ],
          ),
          const Divider(
            thickness: 1.5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "오늘 오후 3:41 출발",
                style: TextStyle(fontSize: 12),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                size: 18,
              ),
              Expanded(
                child: SizedBox(),
              ),
              Text("추천순"),
              Icon(
                Icons.keyboard_arrow_down,
                size: 20,
              )
            ],
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Stack(
              children: [
                ListView.separated(
                    itemCount: busList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RowBusInfo(busInfo: busList[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                          height: 8,
                        )),
                Positioned(
                    bottom: 12,
                    right: 0,
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: const Color(0xFF87ceeb),
                      child: const Icon(Icons.refresh),
                    ))
              ],
            ),
          ))
        ],
      ),
    )));
  }
}
