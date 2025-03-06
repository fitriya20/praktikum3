import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationPage extends StatefulWidget{
  @override
  _LocationPageState createState() => _LocationPageState();
  }

class _LocationPageState extends State<LocationPage> {
  Position? _currentPositon;

  Future<void> _getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentPositon = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GPS Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_currentPositon == null)
              Text(
                'Lokasi: ${_currentPositon!.latitude}, ${_currentPositon!.longitude}'),
                ElevatedButton(
                  onPressed: _getLocation,
                  child: Text('Dapatkan Lokasi'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context, '/sensor');
                  },
                  child: Text('Buka Sensor'),
                )
              ],
            ),
          ),
        );
      }
    }

