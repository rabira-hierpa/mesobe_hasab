import 'package:flutter/material.dart';

class ViewQuote extends StatelessWidget {
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
