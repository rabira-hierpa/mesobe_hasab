import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:mesobe_hasab/pages/gallary.dart';
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
    //String title=imageData['img'].length;
    GalleryPage galleryPage = GalleryPage();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('3 of 45' ),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share,color: Colors.white,), onPressed: null)
        ],
      ),
      body: Center(
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
          //vertical dragUpdate
          onVerticalDragUpdate: (DragUpdateDetails details) {

            if(details.delta.dy <-10)
              Navigator.pop(context);
            else if(details.delta.dy>10)
              Navigator.pop(context);
          },
          child: Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.diagonal3(vector.Vector3(_scale, _scale, _scale)),
            child: Hero(
              tag: 'img' + imageData['img'].toString(),
              child: GalleryPage(page: 3,)
            ),
          ),
        ),
      ),
    );
  }
}

//Stack(fit: StackFit.expand, children: <Widget>[
//GestureDetector(
//child: SwipeDetector(child: Image.asset(imageData['img']),
//onSwipeLeft: (){
//Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
//return  Scaffold(
//appBar: AppBar(
//title: const Text(''),
//),body: Text("this is the Left page"),
//);
//}));
//
//},
//onSwipeRight: (){
//Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
//return GalleryPage(page: imageData['img'],);
//}));
//},
//
//),
//),
//
//]),