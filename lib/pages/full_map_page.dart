import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spark_ev/apis/big_query.dart';
import 'package:spark_ev/apis/repository.dart';
import 'package:spark_ev/apis/uri.dart';
import 'package:spark_ev/constants/colors.dart';
import 'package:spark_ev/models/destination.dart';
import 'package:spark_ev/models/latlang.dart';
import 'package:spark_ev/models/location.dart';
import 'package:spark_ev/models/origin.dart';
import 'package:spark_ev/models/reverse_geocoding_models/reverse_geocoding_response.dart';
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
  //int? _distanceMeters;
  double? _distanceMiles;
  String? _duration;
  String? _costOfJourney;
  String? _countryChargingStation;
  double convertMetertoMile = 1609.34;

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
        leadingWidth: 70,
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
                'charge',
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
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
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
          if (_distanceMiles != null &&
              _duration != null &&
              _costOfJourney != null &&
              _countryChargingStation != null)
            Positioned(
              top: 20,
              left: 10,
              child: Column(
                children: [
                  Container(
                    width: 100,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      shape: BoxShape.rectangle,
                      color: kwhite25525525510,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        const Icon(
                          Icons.drive_eta,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Text(
                            '${_distanceMiles!.toStringAsFixed(2)} Miles',
                            style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                color: kblack15161810,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 100,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      shape: BoxShape.rectangle,
                      color: kwhite25525525510,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        const Icon(
                          Icons.timelapse,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            _duration!,
                            style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                color: kblack15161810,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 100,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      shape: BoxShape.rectangle,
                      color: kwhite25525525510,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        const Icon(
                          Icons.attach_money,
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            '${_costOfJourney!} USD',
                            style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                color: kblack15161810,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            _countryChargingStation!,
                            style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                color: kblack15161810,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (_origin != null)
            FloatingActionButton(
              foregroundColor: kblack15161810,
              backgroundColor: kwhite25525525510,
              onPressed: () async {
                setState(() {
                  _origin = null;
                  _destination = null;
                  _intermediate = null;
                  _pointLatLng = null;
                  _costOfJourney = null;
                  _countryChargingStation = null;
                  _distanceMiles = null;
                  _duration = null;
                });
              },
              child: const Icon(Icons.clear),
            ),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            foregroundColor: kblack15161810,
            backgroundColor: kwhite25525525510,
            onPressed: () async {
              _mapController.animateCamera(
                _intermediate != null
                    ? CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: LatLng(_intermediate!.position.latitude,
                              _intermediate!.position.longitude),
                          zoom: 10,
                        ),
                      )
                    : CameraUpdate.newCameraPosition(_initialcameraPosition),
              );
            },
            child: const Icon(Icons.center_focus_strong),
          ),
        ],
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
        _costOfJourney = null;
        _countryChargingStation = null;
        _distanceMiles = null;
        _duration = null;
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

      final reverseLocation = await _reverseGeocode(
        lat: _intermediate!.position.latitude,
        lang: _intermediate!.position.longitude,
      );

      if (reverseLocation.results.isNotEmpty) {}

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

      final responseModel = await _getRoutes(
        originModel: originModel,
        destinationModel: destinationModel,
        intermediate: intermediateList,
      );

      if (responseModel.routeItems.isNotEmpty &&
          reverseLocation.results.isNotEmpty) {
        final polylineEncoded =
            responseModel.routeItems.first.polylineModel.encodedPolyline;
        final distance = responseModel.routeItems.first.distanceMeters;
        final durationSeconds = responseModel.routeItems.first.duration;
        final miles = distance / convertMetertoMile;
        final strtime =
            durationSeconds.substring(0, durationSeconds.length - 1);

        final time = _convertTime(duration: double.parse(strtime));

        List<PointLatLng> result =
            polylinePoints.decodePolyline(polylineEncoded);
        debugPrint(result.first.latitude.toString());

        final countryName = reverseLocation.results.first.formattedAddress;
        final String kwhpercountry = await _bigQueryData(country: countryName);
        final electricPrice = double.parse(kwhpercountry);
        final cost = _convertCost(
          milesTravelled: miles,
          electricPricePerKwhUSD: electricPrice,
          kwhPer100Miles: 20,
        );
        debugPrint('Price per kwh in $countryName is $kwhpercountry USD');
        setState(() {
          _costOfJourney = cost;
          _countryChargingStation = countryName;
          _distanceMiles = miles;
          _duration = time;
          _pointLatLng = result;
        });
      }
    }
  }

  Future<RouteResponseModel> _getRoutes({
    required OriginModel originModel,
    required DestinationModel destinationModel,
    required List<DestinationModel> intermediate,
  }) async {
    final URI uri = URI();
    final Repository repository = Repository(uri);

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

    final response = await repository.getRoutes(
      requestModel: model,
    );
    return response;
  }

  Future<ReverseGeocoding> _reverseGeocode({
    required double lat,
    required double lang,
  }) async {
    final URI uri = URI();
    final Repository repository = Repository(uri);

    final response = await repository.reverseGeolocate(
      lat: lat,
      lang: lang,
    );
    return response;
  }

  Future<String> _bigQueryData({
    required String country,
  }) async {
    final query = QueryData();

    final client = await query.obtainCredentials();
    final response =
        await query.obtainPricePerKwh(client1: client, country: country);

    return response;
  }

  String _convertTime({
    required double duration,
  }) {
    if (duration <= 60) {
      return '$duration second drive';
    } else if (duration > 60 && duration <= 3600) {
      final time = (duration + 30) / 60;
      return '${time.toStringAsFixed(2)} minute drive';
    } else if (duration > 3600 && duration <= 86400) {
      final time = (duration + 30) / 3600;
      return '${time.toStringAsFixed(2)} hour drive';
    } else if (duration > 86400) {
      final time = (duration + 30) / 86400;
      return '${time.toStringAsFixed(2)} day drive';
    }
    return 'no duration';
  }

  String _convertCost({
    required double milesTravelled,
    required double electricPricePerKwhUSD,
    required double kwhPer100Miles,
  }) {
    final kwhUsed = (milesTravelled * kwhPer100Miles) / 100;
    final cost = kwhUsed * electricPricePerKwhUSD;
    return cost.toStringAsFixed(3);
    // return 'cost not available';
  }
}
