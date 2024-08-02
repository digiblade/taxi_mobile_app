import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geolocator/geolocator.dart';
import 'package:taxiui/Components/Atoms/Buttons/solidButton.dart';
import 'package:taxiui/Components/Atoms/Inputs/roundedInputFiled.dart';

class LocationMapScreen extends StatefulWidget {
  @override
  _LocationMapScreenState createState() => _LocationMapScreenState();
}

class _LocationMapScreenState extends State<LocationMapScreen> {
  GeoPoint? _currentLocation;

  @override
  void initState() {
    super.initState();

    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, handle this case
      setState(() {
        _currentLocation = null;
      });
      return;
    }

    // Check if permission is granted
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permission denied, handle this case
        setState(() {
          _currentLocation = null;
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle this case
      setState(() {
        _currentLocation = null;
      });
      return;
    }

    // Get the current location
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentLocation = GeoPoint(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Test user",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "+91-8242132425",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            )
                          ],
                        ),
                        CircleAvatar(
                          radius: 44,
                          foregroundImage:
                              Image.asset("images/person.jpg").image,
                        )
                      ],
                    ),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.wallet_outlined,
                      color: Colors.grey,
                    ),
                    title: Text(
                      "My Wallet",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.location_on,
                      color: Colors.grey,
                    ),
                    title: Text(
                      "My Trips",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.directions_car,
                      color: Colors.grey,
                    ),
                    title: Text(
                      "Drive with us",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.info_outline,
                      color: Colors.grey,
                    ),
                    title: Text(
                      "About",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: SolidButton(
                    onPressed: () {},
                    label: "Logout",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          _currentLocation == null
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.orange[500],
                    color: Colors.white,
                  ),
                )
              : OSMViewer(
                
                  controller: SimpleMapController(
                    initPosition: _currentLocation!,

                    markerHome: const MarkerIcon(
                      icon: Icon(
                        Icons.location_on,
                        size: 64,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  zoomOption: const ZoomOption(
                    initZoom: 16,
                    minZoomLevel: 11,
                  ),
                ),
          // SafeArea(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Column(
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Builder(
          //                   builder: (context) {
          //                     return IconButton(
          //                       onPressed: () {
          //                         Scaffold.of(context).openDrawer();
          //                       },
          //                       icon: const CircleAvatar(
          //                         backgroundColor: Colors.white,
          //                         radius: 24,
          //                         child: Icon(
          //                           Icons.sort,
          //                           color: Colors.black,
          //                         ),
          //                       ),
          //                     );
          //                   },
          //                 ),
          //                 CircleAvatar(
          //                   foregroundImage:
          //                       Image.asset('images/person.jpg').image,
          //                   radius: 24,
          //                 )
          //               ],
          //             ),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //             child: RoundedInputField(
          //               prefixIcon: Icons.circle,
          //               prefixIconSize: 16,
          //               prefixIconColor: Colors.orange[500],
          //               placeholder: "Pickup location",
          //             ),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //             child: RoundedInputField(
          //               prefixIcon: Icons.circle,
          //               prefixIconSize: 16,
          //               prefixIconColor: Colors.grey,
          //               placeholder: "Drop location",
          //             ),
          //           ),
          //         ],
          //       ),
          //       GestureDetector(
          //         onTap: () {
          //           showModalBottomSheet<void>(
          //             context: context,
          //             builder: (BuildContext context) {
          //               return Card(
          //                 child: SizedBox(
          //                   width: double.infinity,
          //                   child: Padding(
          //                     padding: const EdgeInsets.all(8.0),
          //                     child: Column(
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: [
          //                         const Text(
          //                           "Suggested Rides",
          //                           style: TextStyle(
          //                             fontSize: 20,
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                         ),
          //                         ListTile(
          //                           leading: SizedBox(
          //                             height: 64,
          //                             width: 64,
          //                             child: Image.asset(
          //                               "images/prime.png",
          //                             ),
          //                           ),
          //                           title: const Text(
          //                             "Prime SUV",
          //                             style: TextStyle(
          //                               fontWeight: FontWeight.bold,
          //                             ),
          //                           ),
          //                           subtitle: const Text(
          //                             "Comfortable SUV",
          //                             style: TextStyle(
          //                               fontSize: 12,
          //                             ),
          //                           ),
          //                         ),
          //                         ListTile(
          //                           leading: SizedBox(
          //                             height: 64,
          //                             width: 64,
          //                             child: Image.asset(
          //                               "images/sadan.png",
          //                             ),
          //                           ),
          //                           title: const Text(
          //                             "Prime Sadan",
          //                             style: TextStyle(
          //                               fontWeight: FontWeight.bold,
          //                             ),
          //                           ),
          //                           subtitle: const Text(
          //                             "Comfortable Sadan",
          //                             style: TextStyle(
          //                               fontSize: 12,
          //                             ),
          //                           ),
          //                         ),
          //                         ListTile(
          //                           leading: SizedBox(
          //                             height: 40,
          //                             width: 64,
          //                             child: Image.asset(
          //                               "images/e-rickshaw.png",
          //                             ),
          //                           ),
          //                           title: const Text(
          //                             "E-Rickshaw",
          //                             style: TextStyle(
          //                               fontWeight: FontWeight.bold,
          //                             ),
          //                           ),
          //                           subtitle: const Text(
          //                             "Affordable",
          //                             style: TextStyle(
          //                               fontSize: 12,
          //                             ),
          //                           ),
          //                         ),
          //                         ListTile(
          //                           leading: Padding(
          //                             padding: const EdgeInsets.symmetric(
          //                                 horizontal: 12.0),
          //                             child: CircleAvatar(
          //                               foregroundImage: Image.asset(
          //                                 "images/person.jpg",
          //                               ).image,
          //                             ),
          //                           ),
          //                           title: const Text(
          //                             "Driver",
          //                             style: TextStyle(
          //                               fontWeight: FontWeight.bold,
          //                             ),
          //                           ),
          //                           subtitle: const Text(
          //                             "Rent A driver",
          //                             style: TextStyle(
          //                               fontSize: 12,
          //                             ),
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //               );
          //             },
          //           );
          //         },
          //         child: Card(
          //           child: SizedBox(
          //             width: double.infinity,
          //             child: Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   const Text(
          //                     "Suggested Rides",
          //                     style: TextStyle(
          //                       fontSize: 20,
          //                       fontWeight: FontWeight.bold,
          //                     ),
          //                   ),
          //                   ListTile(
          //                     leading: SizedBox(
          //                       height: 64,
          //                       width: 64,
          //                       child: Image.asset(
          //                         "images/prime.png",
          //                       ),
          //                     ),
          //                     title: const Text(
          //                       "Prime SUV",
          //                       style: TextStyle(
          //                         fontWeight: FontWeight.bold,
          //                       ),
          //                     ),
          //                     subtitle: const Text(
          //                       "Comfortable SUV",
          //                       style: TextStyle(
          //                         fontSize: 12,
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
