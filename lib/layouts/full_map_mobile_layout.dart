import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FullMapMobileLayout extends StatefulWidget {
  const FullMapMobileLayout({super.key});

  @override
  State<FullMapMobileLayout> createState() => _FullMapMobileLayoutState();
}

class _FullMapMobileLayoutState extends State<FullMapMobileLayout> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(20, -20);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width,
            height: size.height - 100,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
