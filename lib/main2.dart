import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
// import 'package:flutter_map/plugin_api.dart'; // Only import if required functionality is not exposed by default

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapScreen(),
    );
  }
}

// const MAPBOX_STYLE = 'mapbox/streets-v12';
// const MARKER_COLOR = Color(0xFFE53935);
// const MAPBOX_ACCESS_TOKEN = "pk.eyJ1IjoiYnJhbnlvZSIsImEiOiJjbDlncTVwaWowOWtrM3Vtd2R2aDZ3c3o0In0.MoFF_EjlzMATPJDHr-zqXA";

// const _myLocation = LatLng(19.432608, -99.133209);

class MapScreen extends StatelessWidget {
  final MapController mapController = MapController();

  MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        mapController: mapController,
        options: MapOptions(
          center: LatLng(37.7749, -122.4194), // Coordenadas de ubicación inicial
          zoom: 12.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}@2x?access_token={accessToken}',
            additionalOptions: const {
              'accessToken': 'TU_ACCESS_TOKEN', // Reemplaza con tu propio token de acceso de Mapbox
              'id': 'TU_ID_DE_ESTILO', // Reemplaza con tu propio ID de estilo de Mapbox
            },
          ),
        ],
      ),
    );
  }
}