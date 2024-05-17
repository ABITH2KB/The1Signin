import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeolocationApp extends StatefulWidget {
  const GeolocationApp({super.key});

  @override
  State<GeolocationApp> createState() => _GeolocationAppState();
}

class _GeolocationAppState extends State<GeolocationApp> {
  Position? _currentLocation;
  bool servicePermission = false;
  late LocationPermission permission;
  GoogleMapController? _mapController;
  final Set<Marker> _markers = {
  };

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Future<Position> _getCurrentLocation() async {
    servicePermission = await Geolocator.isLocationServiceEnabled();

    if (!servicePermission) {
      print("Service Disabled");
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  void _updateCurrentLocationMarker(Position position) {
    setState(() {
      _currentLocation = position;
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId('currentLocation'),
          position: LatLng(position.latitude, position.longitude),
          infoWindow: InfoWindow(title: 'Current Location'),
        ),
      );
      _mapController?.animateCamera(CameraUpdate.newLatLng(
        LatLng(position.latitude, position.longitude),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          children: [
            Expanded(
              child: GoogleMap(
                initialCameraPosition: _kGooglePlex,
                markers: _markers,
                onMapCreated: (GoogleMapController controller) {
                  _mapController = controller;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Container(
                width: 450,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder
                    (
                      borderRadius: BorderRadius.circular(10),
                  )),
                  backgroundColor:  MaterialStateProperty.all(Colors.black)
                ),
                  onPressed: () async {
                    try {
                      Position position = await _getCurrentLocation();
                      _updateCurrentLocationMarker(position);
                    } catch (e) {
                      print('Error: $e');
                    }
                  },
                  child: Text('Get location',style: TextStyle(
                    color: Colors.white
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
