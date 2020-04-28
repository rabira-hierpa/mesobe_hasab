import 'package:flutter/material.dart';
import 'package:mesobe_hasab/pages/ViewQuote.dart';
import 'package:mesobe_hasab/pages/info.dart';
import 'package:mesobe_hasab/pages/splash.dart';
import 'pages/home.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/': (context) => QuoteList(), '/info': (context) => InfoPage(), '/viewQuote': (context) => ViewQuote()},
    ));
