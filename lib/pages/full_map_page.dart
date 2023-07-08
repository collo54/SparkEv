import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spark_ev/apis/routes_repository.dart';
import 'package:spark_ev/apis/uri.dart';
import 'package:spark_ev/constants/colors.dart';
import 'package:spark_ev/models/destination.dart';
import 'package:spark_ev/models/latlang.dart';
import 'package:spark_ev/models/location.dart';
import 'package:spark_ev/models/origin.dart';
import 'package:spark_ev/models/routes_modifires.dart';
import 'package:spark_ev/models/routes_request.dart';
import 'package:spark_ev/models/routes_response.dart';

class FullMapPage extends StatefulWidget {
  const FullMapPage({Key? key}) : super(key: key);

  @override
  State<FullMapPage> createState() => _FullMapPageState();
}

class _FullMapPageState extends State<FullMapPage> {
  late GoogleMapController _mapController;
  Marker? _origin;
  Marker? _destination;
  Marker? _intermediate;
  PolylinePoints polylinePoints = PolylinePoints();
  List<PointLatLng>? _pointLatLng;

  final CameraPosition _initialcameraPosition = const CameraPosition(
    target: LatLng(-1.2921, 36.8219),
    zoom: 10,
  );

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              SizedBox(
                height: 20,
                width: 20,
                child: Image.asset(
                  'assets/images/launchicon.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Text(
                  'Spark Ev',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      color: kblackgrey48484810,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          if (_origin != null)
            TextButton(
              onPressed: () {
                _mapController.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: _origin!.position,
                      zoom: 14.5,
                      tilt: 50,
                    ),
                  ),
                );
              },
              child: Text(
                'start',
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    color: kgreen02075310,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          if (_intermediate != null)
            TextButton(
              onPressed: () {
                _mapController.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: _intermediate!.position,
                      zoom: 14.5,
                      tilt: 50,
                    ),
                  ),
                );
              },
              child: Text(
                'mid',
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    color: kcyan,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          if (_destination != null)
            TextButton(
              onPressed: () {
                _mapController.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: _destination!.position,
                      zoom: 14.5,
                      tilt: 50,
                    ),
                  ),
                );
              },
              child: Text(
                'stop',
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    color: kred23913313310,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          const SizedBox(
            width: 5,
          )
        ],
      ),
      backgroundColor: kblue9813424010,
      body: GoogleMap(
        mapToolbarEnabled: false,
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        onMapCreated: _onMapCreated,
        initialCameraPosition: _initialcameraPosition,
        polylines: {
          if (_pointLatLng != null)
            Polyline(
                polylineId: const PolylineId('overview_polyline'),
                color: kpurple1341332391,
                width: 5,
                points: _pointLatLng!
                    .map(
                      (e) => LatLng(e.latitude, e.longitude),
                    )
                    .toList())
        },
        markers: {
          if (_origin != null) _origin!,
          if (_destination != null) _destination!,
          if (_intermediate != null) _intermediate!,
        },
        onLongPress: _addMarker,
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: kblack15161810,
        backgroundColor: kwhite25525525510,
        onPressed: () {
          _mapController.animateCamera(
            CameraUpdate.newCameraPosition(_initialcameraPosition),
          );
        },
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }

  void _addMarker(LatLng pos) async {
    if (_origin == null ||
        (_origin != null && _destination != null && _intermediate != null)) {
      //set origin
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'origin'),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ),
          position: pos,
        );
        //Reset destination
        _destination = null;
        _intermediate = null;
        _pointLatLng = null;
      });
    } else if (_intermediate == null &&
        _origin != null &&
        _destination == null) {
      setState(() {
        _intermediate = Marker(
          markerId: const MarkerId('Charging station'),
          infoWindow: const InfoWindow(title: 'Charging station'),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueAzure,
          ),
          position: pos,
        );
      });
    } else if (_destination == null &&
        _origin != null &&
        _intermediate != null) {
      //set destination
      setState(() {
        _destination = Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueRed,
          ),
          position: pos,
        );
      });

      final LatLangModel latLangModelOrigin = LatLangModel(
        lat: _origin!.position.latitude,
        lang: _origin!.position.longitude,
      );

      final LocationModel locationModelOrigin = LocationModel(
        latLangModel: latLangModelOrigin,
      );

      final OriginModel originModel = OriginModel(
        locationModel: locationModelOrigin,
      );

      final LatLangModel latLangModeldestination = LatLangModel(
        lat: _destination!.position.latitude,
        lang: _destination!.position.longitude,
      );

      final LocationModel locationModeldestination = LocationModel(
        latLangModel: latLangModeldestination,
      );

      final DestinationModel destinationModel = DestinationModel(
        locationModel: locationModeldestination,
      );

      List<DestinationModel> intermediateList = <DestinationModel>[];

      final LatLangModel latLangModelIntermediate = LatLangModel(
        lat: _intermediate!.position.latitude,
        lang: _intermediate!.position.longitude,
      );

      final LocationModel locationModelIntermidiate = LocationModel(
        latLangModel: latLangModelIntermediate,
      );

      final DestinationModel intermediateModel = DestinationModel(
        locationModel: locationModelIntermidiate,
      );

      intermediateList.add(intermediateModel);

      final responseModel = await send(
        originModel: originModel,
        destinationModel: destinationModel,
        intermediate: intermediateList,
      );

      final polylineEncoded =
          responseModel.routeItems.first.polylineModel.encodedPolyline;
      List<PointLatLng> result = polylinePoints.decodePolyline(polylineEncoded);
      debugPrint(result.first.latitude.toString());

      setState(() {
        _pointLatLng = result;
      });
    }
  }

  Future<RouteResponseModel> send({
    required OriginModel originModel,
    required DestinationModel destinationModel,
    required List<DestinationModel> intermediate,
  }) async {
    final URI uri = URI();
    final RoutesRepository repository = RoutesRepository(uri);

    final RoutesModifiersModel routesModifiersModel = RoutesModifiersModel(
      avoidTolls: false,
      avoidHighways: false,
      avoidFerries: false,
    );
    final RoutesRequestModel model = RoutesRequestModel(
      originModel: originModel,
      destinationModel: destinationModel,
      intermediate: intermediate,
      travelMode: 'DRIVE',
      routingPreference: 'TRAFFIC_AWARE',
      departureTime:
          '2023-10-15T15:01:23.045123456Z', // DateTime.now().toUtc().toString(),
      computeAlternativeRoutes: false,
      routesModifiersModel: routesModifiersModel,
      languageCode: 'en-US',
      units: 'IMPERIAL',
    );

    final response = await repository.getRoutes1(
      requestModel: model,
    );
    return response;
  }
}
