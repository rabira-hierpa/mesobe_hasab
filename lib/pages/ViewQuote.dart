import 'package:flutter/material.dart';

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
      child: Hero(
        tag: 'img'+imageData['img'].toString(),
        child: Image.asset(
            imageData['img']
        ),
      ),
    );
  }

}
