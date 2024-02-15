import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

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

// ignore: constant_identifier_names
const MAPBOX_STYLE = 'mapbox/streets-v12';
// const MARKER_COLOR = Color(0xFFE53935);
// ignore: constant_identifier_names
const MAPBOX_ACCESS_TOKEN = "pk.eyJ1IjoiYnJhbnlvZSIsImEiOiJjbDlncTVwaWowOWtrM3Vtd2R2aDZ3c3o0In0.MoFF_EjlzMATPJDHr-zqXA";

// const _myLocation = LatLng(19.432608, -99.133209);

class MapScreen extends StatelessWidget {
  final MapController mapController = MapController();

  MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(20),
                ),
              ),
              child: MyMap(),
            ),
          )
        ],
      ),
    );
  }
}

class MyMap extends StatelessWidget {
    final MapController mapController = MapController();

    MyMap({super.key});

    @override
    Widget build(BuildContext context) {
      return FlutterMap(
          mapController: mapController,
          options: MapOptions(
            center: LatLng(19.26565405522171, -103.70253115345567), // Coordenadas de ubicación inicial
            zoom: 18.0,
            minZoom: 10.0,
            maxZoom: 18.00,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}@2x?access_token={accessToken}',
              additionalOptions: const {
                'accessToken': MAPBOX_ACCESS_TOKEN, // Reemplaza con tu propio token de acceso de Mapbox
                'id': MAPBOX_STYLE, // Reemplaza con tu propio ID de estilo de Mapbox
              },
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(19.26565405522171, -103.70253115345567),
                  width: 80,
                  height: 80,
                  builder: (context) => const Icon(Icons.location_on, color: Colors.red),
                )
              ],
            ),
          ],
        );
    }
  }