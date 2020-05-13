import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:himnario/minor_widgets/coro_en_busqueda.dart';
import 'package:himnario/data/coro.dart';

class BusquedaRoute extends StatefulWidget {
  @override
  _BusquedaRouteState createState() => _BusquedaRouteState();
}

class _BusquedaRouteState extends State<BusquedaRoute> {
  var checkboxValues = [
    true,
    false,
    false,
    false
  ]; //Filtros velocidades: todos, lentos, medios, rapidos
  int groupTonalidad = 1;
  var searchTonalidad;

  TextEditingController editingController = TextEditingController();

  var corosFiltrados = List<Coro>();
  final todosCoros = fillCorosList();

  var corosEnBusqueda = <CoroEnBusqueda>[];

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

  static const _searchNames = <String>[
    "a aquel que es poderoso",
    "a cristo coronad",
    "somos la circunsicion que alaba en espiritu",
    "a jehova yo cantare",
    "a el sea gloria y poder",
    "a solas con dios",
    "de jehova cantare yo las misericordias",
    "a aquel que es poderoso",
    "a cristo coronad",
    "somos la circunsicion que alaba en espiritu",
    "a jehova yo cantare",
    "a el sea gloria y poder",
    "a solas con dios",
    "de jehova cantare yo las misericordias",
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
  static const _tiempos = <int>[1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5, 6, 7];
  static const _ordenes = <int>[1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5, 6, 7];

  static const _status = <String>[
    "",
    "",
    "n",
    "",
    "n",
    "Nuevo",
    "",
    "",
    "",
    "nuevo",
    "",
    "n",
    "n",
    ""
  ];

  static const _cuerpos = <String>[
    "",
    "",
    "n",
    "",
    "n",
    "Nuevo",
    "",
    "",
    "",
    "nuevo",
    "",
    "n",
    "n",
    ""
  ];

  static const _tonalidades = <String>[
    "F",
    "C",
    "G",
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
  static const _autMusica = <String>[
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
  static const _autLetra = <String>[
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

  @override
  void initState() {
    corosFiltrados.addAll(todosCoros);
    super.initState();
  }

  static List<Coro> fillCorosList() {
    var lista = List<Coro>();
    //eliminate this when paired with firebase pero si tendria que llenar la lista de coros aqui desde Firebase
    for (var i = 0; i < _nombres.length; i++) {
      lista.add(Coro(
        id: _ids[i],
        nombre: _nombres[i],
        searchName: _searchNames[i],
        cuerpo: _cuerpos[i],
        tonalidad: _tonalidades[i],
        velocidad: _velocidades[i],
        tiempo: _tiempos[i],
        orden: _ordenes[i],
        autorLetra: _autLetra[i],
        autorMusica: _autMusica[i],
        status: _status[i],
      ));
    }
    return lista;
  }

  Widget _buildCoroEnBusquedaWidget(List<CoroEnBusqueda> coros) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => coros[index],
      itemCount: coros.length,
    );
  }

  ///Search methods and widgets
  void filterSearchResults(String query, String searchTon, checkboxValues) {
    bool todosVel = checkboxValues[0];
    bool lentos = checkboxValues[1];
    bool medios = checkboxValues[2];
    bool rapidos = checkboxValues[3];

    List<Coro> tempSearchList = List<Coro>();
    tempSearchList.addAll(todosCoros);
    List<Coro> tempFilteredListTon = List<Coro>();
    List<Coro> tempFilteredListVel = List<Coro>();
    List<Coro> tempFilteredListFinal = List<Coro>();

    ///Filtrando por tonalidad
    if (searchTon != "") {
      tempSearchList.forEach((coro) {
        if (coro.tonalidad == searchTon) {
          tempFilteredListTon.add(coro);
        }
      });
    } else {
      tempFilteredListTon.addAll(tempSearchList);
    }

    ///Luego filtrando por velocidad
    //si no esta seleccionado es porque se quiere filtrar en alguna velocidad
    //NO SE SI EL TEXTO SERA: "R" o "Rapido"
    if (!todosVel) {
      if (rapidos && medios) {
        tempFilteredListTon.forEach((coro) {
          if (coro.velocidad == "Rapido" || coro.velocidad == "Medio") {
            tempFilteredListVel.add(coro);
          }
        });
      } else if (rapidos) {
        tempFilteredListTon.forEach((coro) {
          if (coro.velocidad == "Rapido") {
            tempFilteredListVel.add(coro);
          }
        });
      } else if (medios) {
        tempFilteredListTon.forEach((coro) {
          if (coro.velocidad == "Medio") {
            tempFilteredListVel.add(coro);
          }
        });
      } else if (lentos) {
        tempFilteredListTon.forEach((coro) {
          if (coro.velocidad == "Lento") {
            tempFilteredListVel.add(coro);
          }
        });
      }
    } else {
      tempFilteredListVel.addAll(tempFilteredListTon);
    }

    tempFilteredListTon.clear();

    ///Filtrando texto
    if (query.isNotEmpty || query != "") {
      tempFilteredListVel.forEach((coro) {
        if (coro.searchName.contains(query)) {
          tempFilteredListFinal.add(coro);
        }
      });
    } else {
      tempFilteredListFinal.addAll(tempFilteredListVel);
    }

    tempFilteredListVel.clear();

    setState(() {
      corosFiltrados.clear();
      corosFiltrados.addAll(tempFilteredListFinal);
    });

    corosEnBusqueda.clear();
    for (var i = 0; i < corosFiltrados.length; i++) {
      corosEnBusqueda.add(CoroEnBusqueda(
        coro: corosFiltrados[i],
      ));
    }
  }

  List<Coro> filterVelocidades(bool condition, List<Coro> existingList) {
    List<Coro> filteredList = List<Coro>();
    existingList.forEach((coro) {
      if (condition) {
        filteredList.add(coro);
      }
    });
    return filteredList;
  }

  void setSearchTonalidad(int checkboxGroup) {
    switch (checkboxGroup) {
      case 2:
        searchTonalidad = "C";
        break;
      case 3:
        searchTonalidad = "Eb";
        break;
      case 4:
        searchTonalidad = "F";
        break;
      case 5:
        searchTonalidad = "G";
        break;
      case 6:
        searchTonalidad = "Bb";
        break;
      default:
        searchTonalidad = "";
    }
  }

  void setSearchVelocidad(List<int> values) {
    (values[1] == 1) ? checkboxValues[0] = true : checkboxValues[0] = false;
    (values[2] == 1) ? checkboxValues[1] = true : checkboxValues[1] = false;
    (values[3] == 1) ? checkboxValues[2] = true : checkboxValues[2] = false;
    (values[4] == 1) ? checkboxValues[3] = true : checkboxValues[3] = false;
  }

  Widget _buildSearchBarWidget() {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 1.0, 2.0, 0.0),
              child: TextField(
                  controller: editingController,
                  onChanged: (value) {
                    filterSearchResults(value, searchTonalidad, checkboxValues);
                  },
                  decoration: InputDecoration(hintText: "Buscar...")),
            ),
          ),
          RaisedButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              _buildFilterDialog(context).then((onValue) {
                setSearchTonalidad(onValue[0]);
                setSearchVelocidad(onValue);
                filterSearchResults("", searchTonalidad, checkboxValues);
              });
            },
            color: Colors.lightGreen,
            child: Icon(Icons.filter_list, color: Colors.white),
          )
        ],
      ),
    );
  }

  Future<List<int>> _buildFilterDialog(BuildContext context) {
    return (showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Text("Filtros"),
            content: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text("Tonalidad",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0)),
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
                                        ;
                                        setState(() {
                                          groupTonalidad = value;
                                        });
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
                                        setState(() {
                                          groupTonalidad = value;
                                        });
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
                                        setState(() {
                                          groupTonalidad = value;
                                        });
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
                                        setState(() {
                                          groupTonalidad = value;
                                        });
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
                                        setState(() {
                                          groupTonalidad = value;
                                        });
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
                                        setState(() {
                                          groupTonalidad = value;
                                        });
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
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text("Velocidad",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0)),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text("Todos"),
                                  Checkbox(
                                    value: checkboxValues[0],
                                    onChanged: (bool value) {
                                      setState(() {
                                        checkboxValues[0]
                                            ? checkboxValues[0] = false
                                            : checkboxValues[0] = true;
                                        checkboxValues[1] = false;
                                        checkboxValues[2] = false;
                                        checkboxValues[3] = false;
                                      });
                                    },
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text("Lentos"),
                                  Checkbox(
                                    value: checkboxValues[1],
                                    onChanged: (bool value) {
                                      print(value);
                                      setState(() {
                                        checkboxValues[1]
                                            ? checkboxValues[1] = false
                                            : checkboxValues[1] = true;
                                        checkboxValues[0] = false;
                                      });
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text("Medios"),
                                  Checkbox(
                                    value: checkboxValues[2],
                                    onChanged: (bool value) {
                                      print(value);
                                      setState(() {
                                        checkboxValues[2]
                                            ? checkboxValues[2] = false
                                            : checkboxValues[2] = true;
                                        checkboxValues[0] = false;
                                      });
                                    },
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text("Rapidos"),
                                  Checkbox(
                                    value: checkboxValues[3],
                                    onChanged: (bool value) {
                                      print(value);
                                      setState(() {
                                        checkboxValues[3]
                                            ? checkboxValues[3] = false
                                            : checkboxValues[3] = true;
                                        checkboxValues[0] = false;
                                      });
                                    },
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              MaterialButton(
                elevation: 5.0,
                child: Text("Filtrar"),
                onPressed: () {
                  List<int> returnParams = List<int>();
                  var one = 1;
                  var zero = 0;
                  returnParams.add(groupTonalidad);
                  checkboxValues.forEach((value) {
                    (value) ? returnParams.add(one) : returnParams.add(zero);
                  });
                  Navigator.of(context).pop(returnParams);
                },
              )
            ],
          );
        });
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    if (corosEnBusqueda.isEmpty) {
      for (var i = 0; i < corosFiltrados.length; i++) {
        corosEnBusqueda.add(CoroEnBusqueda(
          coro: corosFiltrados[i],
        ));
      }
    }

    final listView = Container(
      child: _buildCoroEnBusquedaWidget(corosEnBusqueda),
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

    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(2.0),
              child: _buildSearchBarWidget(),
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
