import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ViewQuote extends StatefulWidget {
  @override
  _ViewQuoteState createState() => _ViewQuoteState();
}

class _ViewQuoteState extends State<ViewQuote> {
  double _scale = 1.0;
  double _previousScale = 1.0;
  bool _doubleTap = false;
  Map imageData = {};
  @override
  Widget build(BuildContext context) {
    imageData = ModalRoute.of(context).settings.arguments;
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
          if (_previousScale < 1.0)
            _scale = 1.0;
          else
            _previousScale = 1.0;

          setState(() {});
        },
        onDoubleTap: () {
          _doubleTap == false ?  _scale = 1.0 :_scale = _previousScale * 2.0;
          _doubleTap = !_doubleTap;
          setState(() {});
        },
        onTap: () {
          Navigator.pop(context);
        },
        child: Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.diagonal3(vector.Vector3(_scale, _scale, _scale)),
          child: Hero(
            tag: 'img' + imageData['img'].toString(),
            child: Stack(fit: StackFit.expand, children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(imageData['img']),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          elevation: 20,
                          padding: EdgeInsets.all(10),
                          textColor: Colors.white,
                          color: Colors.red,
                          child: Icon(
                            Icons.share,
                            size: 46,
                          ),
                          onPressed: () {},
                          shape: CircleBorder(),
                        )
                      ],
                    ),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
