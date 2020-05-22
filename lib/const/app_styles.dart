import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppStyles {
  static const Color primaryColor = Color.fromRGBO(18, 17, 111, 10);
  static const Color secondaryColor = Color.fromRGBO(246, 155, 15, 1);
  static const TextStyle darkThemeTextColor = TextStyle(color: Colors.white);
  static const TextStyle lightThemeTextColor = TextStyle(color: Colors.black);
  static const Color darkIconColors = Colors.white;
  static const EdgeInsets btnPadding =
      EdgeInsets.symmetric(vertical: 10, horizontal: 60);
  static const EdgeInsets boxSize = EdgeInsets.all(8);
  static  RaisedButton Function(String label, IconData icon) primaryBtn = (String label,IconData iconData){
    return RaisedButton(
      color: Color.fromRGBO(246, 155, 15, 1),
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(iconData),
            SizedBox(width: 5,),
            Text(
              label,
              maxLines: 3,
              softWrap: true,
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
              ),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
    );
  };
}
