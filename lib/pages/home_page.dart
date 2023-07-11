import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:realm/realm.dart';
import 'package:spark_ev/constants/colors.dart';
import 'package:spark_ev/models/ev.dart';
import 'package:spark_ev/widgets/ev_trip_tile.dart';

import '../services/item_bloc.dart';
import '../services/list_bloc.dart';
import 'full_map_page.dart';
import 'user_profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.item,
  }) : super(key: key);
  final List<RealmResults> item;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GoogleMapController _mapController;
  late ListBloc bloc;

  final LatLng _center = const LatLng(10, -20);

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  void initState() {
    bloc =
        ListBloc(widget.item.elementAtOrNull(1) as RealmResults<EvTripModel?>?);
    super.initState();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kwhite25525525510,
        surfaceTintColor: kwhite25525525510,
        leading: const SizedBox(),
        leadingWidth: 5,
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
          CircleAvatar(
            radius: 17,
            backgroundColor: kgrey21721721705,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserProfilePage(),
                  ),
                );
              },
              child: const SizedBox(
                width: 20,
                height: 20,
                child: Center(
                  child: Icon(
                    Icons.person,
                    color: kblackgrey79797910,
                    size: 15,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 21,
          ),
        ],
      ),
      backgroundColor: kblue9813424010,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FullMapPage(
                                    bloc: bloc,
                                  ),
                                ),
                              );
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
                      height: size.height / 2 - 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: kwhite25525525510,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
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
                            'Recent Trips',
                            style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                color: kblack15161810,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 150,
                            child: StreamBuilder(
                              stream: bloc.items!.changes,
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: Text(
                                      'no activity',
                                      style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                          color: kblackgrey79797907,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                return ListView.builder(
                                  // Providing a restorationId allows the ListView to restore the
                                  // scroll position when a user leaves and returns to the app after it
                                  // has been killed while running in the background.
                                  restorationId: 'ItemListView',
                                  itemCount: bloc.items!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final item = bloc.items![index];

                                    return EvTripTile(
                                      bloc: ItemBloc(item!),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
