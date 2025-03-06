import 'package:flutter/material.dart';
import 'package:praktikum3/camera_page.dart';
import 'package:praktikum3/location_page.dart';
import 'package:praktikum3/sensor_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Akses Perangkat Keras',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/camera': (context) => CameraPage(),
        '/location': (context) => LocationPage(),
        '/sensor': (context) => SensorPage(), // Tambahkan rute sensor
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akses Perangkat Keras'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/camera');
              },
              child: const Text('Buka Kamera'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/location');
              },
              child: const Text('Buka Lokasi'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sensor');
              },
              child: const Text('Buka Sensor'),
            ),
          ],
        ),
      ),
    );
  }
}



