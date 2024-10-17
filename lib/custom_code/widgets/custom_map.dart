// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_maps_flutter/google_maps_flutter.dart' as gmap;

class CustomMap extends StatefulWidget {
  const CustomMap({
    Key? key,
    this.width,
    this.height,
    this.center,
    this.cuLocation,
    required this.showShop,
    required this.userCurrentLocation,
  }) : super(key: key);

  final double? width;
  final double? height;
  final LatLng? center;
  final List<CompaniesRow>? cuLocation;
  final Future<dynamic> Function() showShop;
  final LatLng userCurrentLocation;

  @override
  _CustomMapState createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  late CustomMapLocationStruct locationPlaceHolder;
  gmap.GoogleMapController? mapController;

  @override
  void initState() {
    super.initState();
    locationPlaceHolder =
        CustomMapLocationStruct(id: 0, latitude: 0.0, longitude: 0.0);
  }

  Set<gmap.Marker> _createMarkers() {
    return widget.cuLocation!.map((location) {
      return gmap.Marker(
        markerId: gmap.MarkerId(location.companyID.toString()),
        icon: gmap.BitmapDescriptor.defaultMarker,
        position: gmap.LatLng(location.latitude, location.longitude),
        onTap: () {
          // Add your code here to handle the tap event
          // print('Marker with id ${location.id} tapped');
          locationPlaceHolder = CustomMapLocationStruct(
              id: location.companyID,
              latitude: location.latitude,
              longitude: location.longitude);
          FFAppState().shopHolder = locationPlaceHolder;
          widget.showShop!();
        },
      );
    }).toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        gmap.GoogleMap(
          onMapCreated: (gmap.GoogleMapController controller) {
            mapController = controller;
          },
          initialCameraPosition: gmap.CameraPosition(
              target: gmap.LatLng(
                  widget.center!.latitude, widget.center!.longitude),
              zoom: 14),
          myLocationButtonEnabled: false,
          myLocationEnabled: true, // This line is added
          zoomControlsEnabled: false,
          mapToolbarEnabled: false,
          markers: _createMarkers(),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton(
            onPressed: () async {
              await mapController!.animateCamera(
                gmap.CameraUpdate.newCameraPosition(
                  gmap.CameraPosition(
                    target: gmap.LatLng(widget.userCurrentLocation.latitude,
                        widget.userCurrentLocation.longitude),
                    zoom: 14,
                  ),
                ),
              );
            },
            child: const Icon(Icons.gps_not_fixed),
          ),
        ),
      ],
    );
  }
}
