import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppStyles {
  /* Font Sizes */
  static const double labelFontSize = 16;
  /* Colors */
  static const Color lightTheme = Colors.white;
  static const Color darkTheme = Colors.black54;
  static const Color splashColor = Colors.white;
  static const Color primaryColor = Color.fromRGBO(18, 17, 111, 10);
  static const Color secondaryColor = Color.fromRGBO(246, 155, 15, 1);
  static const Color darkIconColors = Colors.white;
  static const Color lightThemeLabelColors = Colors.black45;
  /* Text Styles */
  static const TextStyle lightThemeTextColor = TextStyle(color: Colors.black);
  static const TextStyle darkThemeTextColor = TextStyle(color: Colors.white);
  /* Padding */
  static const EdgeInsets btnPadding =
      EdgeInsets.symmetric(vertical: 10, horizontal: 60);
  static const EdgeInsets boxSize = EdgeInsets.all(8);

  /* Dummy Buttons */
  static  RaisedButton Function(String label, IconData icon) primaryBtn = (String label,IconData iconData){
    return RaisedButton(
      color: secondaryColor,
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
