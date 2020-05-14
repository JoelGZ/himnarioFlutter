import 'package:flutter/material.dart';
import 'data/coro.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class PartituraRoute extends StatefulWidget {
  final Coro coro;

  PartituraRoute({
    @required this.coro,
  }) : assert(coro != null);

  @override
  _PartituraRouteState createState() => _PartituraRouteState();
}

class _PartituraRouteState extends State<PartituraRoute> {
  double _scale = 1.0;

  double _previousScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onScaleStart: (ScaleStartDetails details) {
          _previousScale = _scale;
          setState(() {});
        },
        onScaleUpdate: (ScaleUpdateDetails details) {
          _scale = _previousScale * details.scale;
          setState(() {});
        },
        onScaleEnd: (ScaleEndDetails details) {
          _previousScale = 1.0;
          setState(() {});
        },
        child: Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.diagonal3(Vector3(_scale, _scale, _scale)),
          child: Image(
            image: NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/alabadle-con-entendimiento.appspot.com/o/partituras%2Fa_aquel_que_es_poderoso.jpg?alt=media&token=68257116-9c12-4852-9944-0cb4e2ac6c42'),
          ),
        ),
      ),
    );
  }
}
