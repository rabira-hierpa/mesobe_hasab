import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

class ViewQuote extends StatefulWidget {
  @override
  _ViewQuoteState createState() => _ViewQuoteState();
}

class _ViewQuoteState extends State<ViewQuote> {
  double _scale=1.0;
  double _previousScale=1.0;
  Map imageData = {};
  @override
  Widget build(BuildContext context) {
    imageData = ModalRoute.of(context).settings.arguments;
    return Container(
      child: GestureDetector(
        onScaleStart: (ScaleStartDetails details){
//          if(_scale<1.0)
//          _previousScale=1.0;
//          else
            _previousScale=_scale;
          print(_previousScale);
          setState(() {});
        },
        onScaleUpdate: (ScaleUpdateDetails details){

          _scale=_previousScale * details.scale;
          print("form update $_scale");
          setState(() {});
        },
        onScaleEnd: (ScaleEndDetails details){
          if(_previousScale < 1.0)
          _scale=1.0;
          else
            _previousScale=1.0;

          setState(() {});
        },
    child: Transform(
    alignment: FractionalOffset.center,
    transform: Matrix4.diagonal3(Vector3(_scale,_scale,_scale)),child: Hero(
          tag: 'img'+imageData['img'].toString(),

            child: Image.asset(
                imageData['img']
            ),
          ),
        ),
      ),
    );
  }

}
