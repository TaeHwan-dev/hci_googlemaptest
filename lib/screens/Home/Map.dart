import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hci_googlemap/screens/Home/HomeObject.dart';
import 'package:location/location.dart';

class Map extends StatefulWidget {
  @override
  State<Map> createState() => MapState();
}

class MapState extends State<Map> {
  late GoogleMapController _controller;
  bool homeObjectVisible = true;
  final List<Marker> markers = [];
  late Marker cctvMarker;
  late String mapStyle;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.886253, 127.735648),
    zoom: 16,
  );

  @override
  void initState() {
    super.initState();

    BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "assets/cctvMarker.png")
        .then((icon) {
      LatLng latLng = const LatLng(37.876517, 127.735891);
      cctvMarker = Marker(
          position: latLng,
          markerId:  MarkerId("cctv"),
          icon: icon,
          infoWindow: InfoWindow(title: "팔호광장   〉",onTap: (){
            Navigator.pushNamed(context, '/cctv',arguments: "팔호광장");
          }),
          onTap: () {
            moveCamara(latLng);
          });
    });

    rootBundle.loadString('assets/map_style.txt').then((string) {
      mapStyle = string;
    });
  }


  Future<void> onMapCreated(GoogleMapController controller) async {
    _controller = controller;
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          // mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          zoomControlsEnabled: false,
          onMapCreated: onMapCreated,
          onTap: (latLng) {
            homeObjectVisibleToggle();
          },
          markers: markers.toSet(),

        ),
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

  void zoomChange(bool scale) {
    _controller
        .animateCamera(scale ? CameraUpdate.zoomIn() : CameraUpdate.zoomOut());
  }
  void moveCamara(LatLng latLng) async {
    double zoomLevel = await _controller.getZoomLevel();
    _controller
        .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: latLng,zoom: zoomLevel)));
  }

  void homeObjectVisibleToggle() {
    setState(() {
      homeObjectVisible = !homeObjectVisible;
    });
  }

  void toggleCCTVMarker(){
    setState(() {
      if(!markers.remove(cctvMarker)){
        markers.add(cctvMarker);
      }
    });
  }


  void _currentLocation() async {
    LocationData currentLocation;
    try {
      currentLocation = await Location().getLocation();
    } on Exception {
      return;
    }

    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
        zoom: 18.0,
      ),
    ));
  }
}