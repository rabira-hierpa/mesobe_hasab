import 'package:flutter/material.dart';
import 'quotes.dart';
import 'package:share/share.dart';
class QuoteCard extends StatelessWidget {
  final  Quote quote;
  final Function share;
  QuoteCard({this.quote,this.share});
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                quote.text,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 6.0),
              Text(
                quote.author,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 8.0,),
              FlatButton.icon(onPressed: share, icon: Icon(Icons.share), label: Text("share") )
            ],
          ),
        )
    );
  }
}