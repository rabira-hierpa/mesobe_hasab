import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewQuote extends StatelessWidget {
  Map imageData = {};
  @override
  Widget build(BuildContext context) {
    imageData = ModalRoute.of(context).settings.arguments;
    return Container(
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
                height: 70,
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
                        size: 26,
                      ),
                      onPressed: () {},
                      shape: CircleBorder(),
                    )
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}
