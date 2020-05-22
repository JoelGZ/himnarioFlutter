import 'package:flutter/material.dart';
import 'package:himnario/coro_detail_route.dart';
import 'package:himnario/data/coro.dart';

final ColorSwatch secondaryTextColor = Colors.grey[600];
final double detailFontSize = 13.0;

class CoroEnBusqueda extends StatelessWidget {
  final Coro coro;

  const CoroEnBusqueda({
    @required this.coro,
  }) : assert(coro != null);

  /// Returns a Container that indicates the status. (coro Nuevo o no)
  /// If no status is given Container is empty
  Widget _statusWidget(status) {
    Widget _container;

    if (status.contains("n")) {
      //status 'n' means coro nuevo, everything else doesn't matter talvez podria poner h para himno
      _container = Container(
          padding: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Text(
            "Nuevo",
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
    var nombre = coro.nombre;
    var velocidad = coro.velocidad;
    var tonalidad = coro.tonalidad;
    var id = coro.id;
    var status = coro.status;

    return Material(
      child: Container(
        child: InkWell(
          splashColor: Colors.grey,
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CoroDetailRoute(coro: coro,)));
          },
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
                            style: TextStyle(fontSize: 16.0),
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
