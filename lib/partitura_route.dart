import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'data/coro.dart';

class PartituraRoute extends StatefulWidget {
  final Coro coro;

  PartituraRoute({
    @required this.coro,
  }) : assert(coro != null);

  @override
  _PartituraRouteState createState() => _PartituraRouteState();
}

class _PartituraRouteState extends State<PartituraRoute> {

  ///https://pub.dev/packages/photo_view
  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));

    double _scaleMultiple;
    if (MediaQuery.of(context).orientation == Orientation.portrait){
      _scaleMultiple = 1.0;
    } else {
      _scaleMultiple = 1.1;
    }

    return Container(
        child: PhotoView(
          imageProvider: NetworkImage(
              'https://firebasestorage.googleapis.com/v0/b/alabadle-con-entendimiento.appspot.com/o/partituras%2Fa_aquel_que_es_poderoso.jpg?alt=media&token=68257116-9c12-4852-9944-0cb4e2ac6c42'),
          initialScale: PhotoViewComputedScale.covered * _scaleMultiple,
          minScale: PhotoViewComputedScale.covered * 1.0,
          maxScale: PhotoViewComputedScale.covered * 2.0,
          loadingBuilder: (context, progress) {
            return Center(child: Container(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(value: progress == null
                  ? null
                  : progress.cumulativeBytesLoaded /
                  progress.expectedTotalBytes,),
            ));
          },
          basePosition: Alignment.topCenter,
          backgroundDecoration: BoxDecoration(color: Theme.of(context).canvasColor),
        )
    );
  }
}
