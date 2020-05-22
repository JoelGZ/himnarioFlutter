import 'package:flutter/material.dart';
import 'package:himnario/busqueda_route.dart';
import 'package:himnario/mis_listas_route.dart';

class CustomDrawer extends StatelessWidget {
  Widget _customListTile(IconData icon, String title, Function onTap) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
      child: InkWell(
        highlightColor: Colors.grey,
        splashColor: Colors.deepOrange,
        child: ListTile(
          leading: Icon(
            icon,
            size: 40.0,
            color: Colors.black,
          ),
          title: Text(
            title,
            style: TextStyle(fontSize: 17.0),
          ),
          trailing: Icon(Icons.arrow_right),
        ),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
            Colors.deepOrange,
            Colors.orangeAccent,
          ])),
          child: Text(
            "Himnario Alabadle con Entendimiento",
            style: TextStyle(
              fontSize: 28.0,
              color: Colors.white,
            ),
          ),
        ),
        _customListTile(Icons.search, "Búsqueda", () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
//          Navigator.of(context)
//              .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
//            return BusquedaRoute();
//          }));
        }),
        _customListTile(Icons.list, "Mis Listas", () {
          Navigator.of(context).pop();
          Navigator.of(context)
              .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
            return MisListasRoute();
          }));
        }),
        _customListTile(Icons.settings, "Ajustes", () {
          Navigator.of(context).pop();
          Navigator.of(context)
              .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
            return BusquedaRoute();
          }));
        }),
      ],
    ));
  }
}
