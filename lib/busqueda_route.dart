import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:himnario/data/coro_en_busqueda.dart';

class BusquedaRoute extends StatelessWidget {
  static const groupTonalidad = 1;
  bool checkboxTodosValue = true;
  bool checkboxRapidosValue = false;
  bool checkboxLentosValue = false;
  bool checkboxMediosValue = false;

  static const _nombres = <String>[
    "A Aquel que es Poderoso",
    "A Cristo Coronad",
    "Somos la Circunsicion que Alaba en Espiritu",
    "A Jehova yo Cantare",
    "A El Sea Gloria y Poder",
    "A Solas con Dios",
    "De Jehova Cantare yo las Misericordias",
    "A Aquel que es Poderoso",
    "A Cristo Coronad",
    "A Dios sea la Gloria",
    "A Jehova yo Cantare",
    "A El Sea Gloria y Poder",
    "A Solas con Dios",
    "De Jehova Cantare yo las Misericordias"
  ];

  static const _velocidades = <String>[
    "Lento",
    "Medio",
    "Lento",
    "Medio",
    "Rapido",
    "Lento",
    "Rapido",
    "Lento",
    "Medio",
    "Lento",
    "Medio",
    "Rapido",
    "Lento",
    "Rapido"
  ];

  static const _ids = <int>[1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5, 6, 7];

  static const _status = <String>[
    "",
    "",
    "Nuevo",
    "",
    "Nuevo",
    "Nuevo",
    "",
    "",
    "",
    "Nuevo",
    "",
    "Nuevo",
    "Nuevo",
    ""
  ];

  static const _tonalidades = <String>[
    "F",
    "C",
    "F",
    "C",
    "Bb",
    "Bb",
    "Eb",
    "F",
    "C",
    "F",
    "C",
    "Bb",
    "Bb",
    "Eb"
  ];

  TextEditingController controller;

  Widget _buildCoroEnBusquedaWidget(List<CoroEnBusqueda> coros) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => coros[index],
      itemCount: coros.length,
    );
  }

  Widget _buildSearchFieldWidget() {
    return TextField(
        controller: controller,
        decoration: InputDecoration(hintText: "Buscar...")
    );
  }

  //TODO: update State
  Widget _buildDialogContentWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text("Tonalidad",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("Todos"),
                            Radio(
                              value: 1,
                              groupValue: groupTonalidad,
                              onChanged: (value) {
                                print(value);

                                //TODO: setState
//                          setState((){
//                            groupTonalidad = value;
//                          });
                              },
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text("C"),
                            Radio(
                              value: 2,
                              groupValue: groupTonalidad,
                              onChanged: (value) {
                                print(value);

                                //TODO: setState
//                          setState((){
//                            groupTonalidad = value;
//                          });
                              },
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text("Eb"),
                            Radio(
                              value: 3,
                              groupValue: groupTonalidad,
                              onChanged: (value) {
                                print(value);

                                //TODO: setState
//                          setState((){
//                            groupTonalidad = value;
//                          });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("F"),
                            Radio(
                              value: 4,
                              groupValue: groupTonalidad,
                              onChanged: (value) {
                                print(value);

                                //TODO: setState
//                          setState((){
//                            groupTonalidad = value;
//                          });
                              },
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text("G"),
                            Radio(
                              value: 5,
                              groupValue: groupTonalidad,
                              onChanged: (value) {
                                print(value);

                                //TODO: setState
//                          setState((){
//                            groupTonalidad = value;
//                          });
                              },
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text("Bb"),
                            Radio(
                              value: 6,
                              groupValue: groupTonalidad,
                              onChanged: (value) {
                                print(value);

                                //TODO: setState
//                          setState((){
//                            groupTonalidad = value;
//                          });
                              },
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text("Velocidad",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
              ),
            ),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[Row(
                    children: <Widget>[
                      Text("Todos"),
                      Checkbox(
                        //TODO: has to change this value
                        value: checkboxTodosValue,
                        onChanged: (bool value){
                          print(value);
                          //TODO: setState
                          //   setState(() {})
                        },
                      )
                    ],
                  ), Row(
                    children: <Widget>[
                      Text("Rapidos"),
                      Checkbox(
                        //TODO: has to change this value
                        value: checkboxRapidosValue,
                        onChanged: (bool value){
                          print(value);
                          //TODO: setState
                          //   setState(() {})
                        },
                      )
                    ],
                  )],
                ),
                Column(
                  children: <Widget>[Row(
                    children: <Widget>[
                      Text("Medios"),
                      Checkbox(
                        //TODO: has to change this value
                        value: checkboxMediosValue,
                        onChanged: (bool value){
                          print(value);
                          //TODO: setState
                          //   setState(() {})
                        },
                      )
                    ],
                  ), Row(
                    children: <Widget>[
                      Text("Lentos"),
                      Checkbox(
                        //TODO: has to change this value
                        value: checkboxLentosValue,
                        onChanged: (bool value){
                          print(value);
                          //TODO: setState
                          //   setState(() {})
                        },
                      )
                    ],
                  )],
                )
              ],
            )
          ],)
        ],
      ),
    );
  }

  _buildFilterDialog(BuildContext context) {
    return (showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Filtros"),
          content: _buildDialogContentWidget(),
          actions: <Widget>[
            MaterialButton(
              elevation: 5.0,
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            MaterialButton(
              //TODO: Cambiar filtro con setState
              elevation: 5.0,
              child: Text("Filtrar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    final coros = <CoroEnBusqueda>[];

    for (var i = 0; i < _nombres.length; i++) {
      coros.add(CoroEnBusqueda(
        nombre: _nombres[i],
        velocidad: _velocidades[i],
        tonalidad: _tonalidades[i],
        id: _ids[i],
        status: _status[i],
      ));
    }

    final listView = Container(
      child: _buildCoroEnBusquedaWidget(coros),
    );

    final appBar = AppBar(
      title: Text("Búsqueda"),
    );

    //TODO: Implement navigation and styling
    final drawer = Drawer(
        child: ListView(
      children: <Widget>[
        ListTile(leading: Icon(Icons.search), title: Text("Búsqueda")),
        ListTile(leading: Icon(Icons.list), title: Text("Mis Listas")),
        ListTile(leading: Icon(Icons.settings), title: Text("Ajustes")),
      ],
    ));

    final search = Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 1.0, 2.0, 0.0),
              child: _buildSearchFieldWidget(),
            ),
          ),
          RaisedButton(
            onPressed: () {
              _buildFilterDialog(context);
            },
            color: Colors.lightGreen,
            child: Icon(Icons.filter_list, color: Colors.white),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(2.0),
              child: search,
            ),
            Expanded(
              child: listView,
            )
          ],
        ),
      ),
    );
  }
}

//class BusquedaRouteState extends StateFullWidget {
//
//}
