import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hci_googlemap/screens/CCTV.dart';
import 'package:hci_googlemap/screens/Home/Home.dart';
import 'package:hci_googlemap/screens/PathFinding.dart';
import 'package:hci_googlemap/screens/Search/Search.dart';
import 'package:hci_googlemap/widgets/buttons/ButtonTest.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        '/': (context) => Home(),
        '/buttonTest': (context) => ButtonTest(),
        '/pathFinding': (context) => PathFinding(),
        '/search': (context) => Search(),
        '/cctv': (context) => CCTV(),
        // '/map': (context) => MapSample()
      },
      theme: ThemeData(fontFamily: 'Hanna'),
    ),
  );
}

