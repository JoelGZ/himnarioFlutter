import 'package:flutter/material.dart';

final ColorSwatch secondaryTextColor = Colors.grey;
final double detailFontSize = 13.0;

class CoroEnBusqueda extends StatelessWidget {
  final String nombre;
  final String velocidad;
  final String tonalidad;
  final int id;
  final String status;

  const CoroEnBusqueda({
    @required this.nombre,
    @required this.velocidad,
    @required this.tonalidad,
    @required this.id,
    this.status,
  })  : assert(nombre != null),
        assert(velocidad != null),
        assert(tonalidad != null),
        assert(id != null);

  /// Returns a Container that indicates the status. (coro Nuevo o no)
  /// If no status is given Container is empty
  Widget _statusWidget(status) {
    Widget _container;

    if (status != "") {
      _container = Container(
          padding: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Text(
            status,
            style: TextStyle(color: Colors.white, fontSize: detailFontSize),
          ));
    } else {
      _container = Container(
        color: Colors.transparent,
      );
    }
    return _container;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: InkWell(
          splashColor: Colors.lightGreen,
          //TODO: Go to CoroDetailRoute
          //Send coro id
          onTap: () => print("Coro seleccionado $status"),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                    padding: EdgeInsets.fromLTRB(12.0, 2.0, 0.0, 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 4.0, 8.0),
                          child: Text(
                            nombre,
                            //textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 17.0),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding:
                              const EdgeInsets.fromLTRB(0.0, 0.0, 4.0, 0.0),
                              child: Text("#$id",
                                  style: TextStyle(
                                      color: secondaryTextColor,
                                      fontSize: detailFontSize)),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.fromLTRB(0.0, 0.0, 4.0, 0.0),
                              child: Text(velocidad,
                                  style: TextStyle(
                                      color: secondaryTextColor,
                                      fontSize: detailFontSize)),
                            ),
                            _statusWidget(status),
                          ],
                        )
                      ],
                    )),
              ),
              Container(
                  padding: EdgeInsets.all(14.0),
                  child: Center(
                    child: Text(
                      tonalidad,
                      textAlign: TextAlign.right,
                      style:
                      TextStyle(fontSize: 15.0, color: secondaryTextColor),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
