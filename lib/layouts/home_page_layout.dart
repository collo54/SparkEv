import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spark_ev/constants/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spark_ev/pages/full_map_page.dart';

class HomePageMobileLayout extends StatefulWidget {
  const HomePageMobileLayout({super.key});

  @override
  State<HomePageMobileLayout> createState() => _HomePageMobileLayoutState();
}

class _HomePageMobileLayoutState extends State<HomePageMobileLayout> {
  late GoogleMapController _mapController;

  final LatLng _center = const LatLng(10, -20);

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
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width,
            height: size.height / 2 + 30,
            child: Stack(
              alignment: Alignment.center,
              children: [
                GoogleMap(
                  zoomControlsEnabled: false,
                  myLocationButtonEnabled: false,
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 0,
                  ),
                ),
                Positioned(
                  bottom: 25,
                  left: 15,
                  child: MaterialButton(
                    onPressed: () async {
                      /*
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FullMapPage(),
                        ),
                      );
                      */
                    },
                    color: kpurple13413323910,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.0),
                      ),
                    ),
                    height: 45,
                    minWidth: 140,
                    child: Row(
                      children: [
                        Text(
                          'Explore',
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              color: kwhite25525525510,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 3),
                          child: Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 14,
                            color: kwhite25525525510,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 35,
                  right: 15,
                  child: Text(
                    'Last updated\n   7/11/2023',
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        color: kwhite25525525510,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: size.width,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: kwhite25525525510,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: 35,
                    height: 4,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      shape: BoxShape.rectangle,
                      color: kgrey15515515510,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Recent Activities',
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        color: kblack15161810,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 63,
                  ),
                  Text(
                    'no activity',
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        color: kblackgrey79797907,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
