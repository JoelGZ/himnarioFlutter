import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:himnario/data/coro.dart';
import 'package:himnario/partitura_route.dart';
import 'package:himnario/coro_detail_letra.dart';

class CoroDetailRoute extends StatefulWidget {
  final Coro coro;

  const CoroDetailRoute({
    @required this.coro,
  }) : assert(coro != null);

  @override
  _CoroDetailRouteState createState() => _CoroDetailRouteState(coro: coro);
}

class _CoroDetailRouteState extends State<CoroDetailRoute> {
  final Coro coro;
  int _currentTabIndex = 0;

  _CoroDetailRouteState({
    @required this.coro,
  }) : assert(coro != null);

  //if in landscape no appBar or tabbar is shown
  Widget responsiveLayoutWidget(Orientation deviceOrientation, double shortestSide){
    ///https://www.youtube.com/watch?v=elLkVWt7gRM
    ///If partitura tab is selected and we are in landscape and the device is a phone (<600)
    if (deviceOrientation == Orientation.landscape && _currentTabIndex == 1 && shortestSide < 600) {
      return PartituraRoute(coro: coro);
    } else {
      var tabs = [
        CoroDetailLetra(coro: coro),
        PartituraRoute(coro: coro),
      ];

      return Scaffold(
        appBar: AppBar(),
        body: tabs[_currentTabIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentTabIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.library_books), title: Text("Letra")),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_music), title: Text("Partitura")),
          ],
          onTap: (index) {
            setState(() {
              _currentTabIndex = index;
            });
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    assert(debugCheckHasMediaQuery(context));
    return responsiveLayoutWidget(MediaQuery.of(context).orientation, MediaQuery.of(context).size.shortestSide);
  }
}
