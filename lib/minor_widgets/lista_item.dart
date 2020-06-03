import 'package:flutter/material.dart';
import 'package:himnario/data/lista.dart';
import 'package:himnario/lista_detail_route.dart';

final ColorSwatch secondaryTextColor = Colors.grey;

class ListaItem extends StatelessWidget {
  final Lista lista;

  const ListaItem({
    @required this.lista,
  }) : assert(lista != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade400,
          ),
        ),
      ),

      child: InkWell(
        splashColor: Colors.grey,
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ListaDetailRoute(lista: lista,)));
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(12.0, 12.0, 4.0, 12.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  lista.nombre,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 4.0, 0),
                child: Text(
                  lista.tonalidad,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: secondaryTextColor,
                  ),
                ),
              ),
              Icon(Icons.arrow_right),
            ],
          ),
        ),
      ),
    );
  }
}
