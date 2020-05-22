import 'package:flutter/material.dart';
import 'package:himnario/busqueda_route.dart';

void main() {
  runApp(HimnarioAcEApp());
}

class HimnarioAcEApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Himnario",
      theme: ThemeData(primaryColor: Colors.grey[300]),
      home: BusquedaRoute(),
    );
  }

}