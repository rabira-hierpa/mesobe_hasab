import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(18, 17, 111, 20),
        elevation: 8.0,
        title: Text(
          'ስለ መሶበ ሃሳብ ',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: (MediaQuery.of(context).size.height * 0.045)),
            FadeInImage(
              placeholder: AssetImage(
                'assets/img/loading.gif',
              ),
              image: AssetImage('assets/img/logo_alt.jpg'),
              width: 300,
              height: 300,
              fit: BoxFit.scaleDown,
            ),
            SizedBox(height: (MediaQuery.of(context).size.height * 0.0025)),
            Stack(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('መሶበ',
                        style: TextStyle(
                            color: Color.fromRGBO(18, 17, 111, 20),
                            fontSize: 72,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 55, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('ሃሳብ',
                          style: TextStyle(
                              color: Color.fromRGBO(246, 155, 15, 1),
                              fontSize: 72,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Developed by'),
                Stack(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Kiya Tolcha'),
                        FlatButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.code),
                            label: Text('@kiyaTolcha'))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Rabra Hierpa'),
                          FlatButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.code),
                              label: Text('@rabira-hierpa'))
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ]),
    );
  }
}
