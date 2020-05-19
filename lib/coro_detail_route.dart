import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:himnario/data/coro.dart';
import 'package:himnario/partitura_route.dart';
import 'package:himnario/coro_detail_letra.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'dart:async';

///This Route is the "holder" for coro_detail_letra y partitura_route
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
  Icon appBarIcon = Icon(Icons.play_arrow);
  bool playPauseFlag = true;  //true = show play
  var audioPlayer = AssetsAudioPlayer();
  String audioFilePath;     //en init state lo hare = "assets/audios/$sName.mp3 siendo sName el sName separado por _ en vez de espacios

  _CoroDetailRouteState({
    @required this.coro,
  }) : assert(coro != null);

  Future<bool> _onBackPressed() {
    audioPlayer.stop();
    Navigator.of(context).pop(true);
  }


  //if in landscape no appBar or tabbar is shown
  Widget responsiveLayoutWidget (
      Orientation deviceOrientation, double shortestSide) {

    ///https://www.youtube.com/watch?v=elLkVWt7gRM
    ///If partitura tab is selected and we are in landscape and the device is a phone (<600)
    if (deviceOrientation == Orientation.landscape &&
        _currentTabIndex == 1 &&
        shortestSide < 600) {
      return PartituraRoute(coro: coro);
    } else {
      var tabs = [
        CoroDetailLetra(coro: coro),
        PartituraRoute(coro: coro),
      ];

      final appBar = AppBar(
        actions: <Widget>[
          IconButton(
              icon: appBarIcon,
              onPressed: () {
                setState(() {
                  if (playPauseFlag) {
                    audioPlayer.open(
                      Audio("assets/audios/a_aquel_que_es_poderoso.mp3"),
                    );
                    audioPlayer.play();
                    appBarIcon = Icon(Icons.pause);
                  } else {
                    audioPlayer.pause();
                    appBarIcon = Icon(Icons.play_arrow);
                  }
                  playPauseFlag = !playPauseFlag;
                });
              }
          )
        ],
      );

      return Scaffold(
        appBar: appBar,
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
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: responsiveLayoutWidget(MediaQuery.of(context).orientation,
          MediaQuery.of(context).size.shortestSide),
    );
  }
}
