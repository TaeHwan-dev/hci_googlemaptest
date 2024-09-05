import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hci_googlemap/screens/Home/HomeObject.dart';
import 'package:location/location.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Map extends StatefulWidget{
  @override
  State<StatefulWidget> createState()  => MapState();

}
class MapState extends State<Map>
{
  late WebViewController _controller;
  bool homeObjectVisible = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.scale(
            scale: 2.3,
            child: WebView(
              initialUrl: '',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController){
                _controller=webViewController;
                loadAsset();
              },
              javascriptChannels: <JavascriptChannel>{
                _onTap(context),
                _onCCTVTap(context),
              },
            )),
        Padding(
            padding: const EdgeInsets.only(top: 24),
            child: HomeObject(
              visible: homeObjectVisible,
              zoomEvent: (isScale) {
                zoomChange(isScale);
              },
              cctvEvent: toggleCCTVMarker,
              locatEvent: _currentLocation,
            ))
      ],
    );
  }

  loadAsset() async {
    String fileHtmlContents = await rootBundle.loadString('assets/map.html');
    _controller.loadUrl(Uri.dataFromString(fileHtmlContents,
        mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());

  }

  JavascriptChannel _onTap(BuildContext context) {
    return JavascriptChannel(
        name: 'onTap',
        onMessageReceived: (JavascriptMessage message) {
          homeObjectVisibleToggle();
        });
  }
  JavascriptChannel _onCCTVTap(BuildContext context) {
    return JavascriptChannel(
        name: 'onCCTVTap',
        onMessageReceived: (JavascriptMessage message) {
          Navigator.pushNamed(context, '/cctv',arguments: "팔호광장");
        });
  }

  void zoomChange(bool scale) {
    _controller.runJavascript('zoomChange(${scale ? 1 : 0});');
  }

  void homeObjectVisibleToggle() {
    setState(() {
      homeObjectVisible = !homeObjectVisible;
    });
  }

  void toggleCCTVMarker(){
    _controller.runJavascript('toggleCCTVMarker();');
  }


  void _currentLocation() async {
    LocationData currentLocation;
    try {
      currentLocation = await Location().getLocation();
    } on Exception {
      return;
    }
    _controller.runJavascript('currentLocation(${currentLocation.latitude!},${currentLocation.longitude!});');
  }
}