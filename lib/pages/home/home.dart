import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mesobe_hasab/services/auth_service.dart';

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  final AuthService _authService = AuthService();
  List<String> imgUrls = [];
  @override
  void initState()  {
    super.initState();
    for (var i = 1; i <= 31; i++) {
      imgUrls.add("assets/quotes/$i.jpg");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'መሶበ ሃሳብ',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        elevation: 8.0,
        backgroundColor: Color.fromRGBO(18, 17, 111, 10),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () => Navigator.pushNamed(context, '/info'),
          ),
          IconButton(
            padding: EdgeInsets.fromLTRB(0, 0, 6, 0),
              onPressed: () async {
                await _authService.signOut();
                Navigator.pushReplacementNamed(context,'/signIn' );
              },
              icon: Icon(Icons.exit_to_app, color: Colors.white),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
          margin: EdgeInsets.all(12.0),
          child: new StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              crossAxisSpacing: 6,
              mainAxisSpacing: 12,
              itemCount: imgUrls.length,
              itemBuilder: (context, index) {
                return Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        child: GestureDetector(
                          child: Hero(
                            tag: 'img' + index.toString(),
                            child: FadeInImage(
                              placeholder: AssetImage(
                                'assets/img/loading.gif',
                              ),
                              image: AssetImage(imgUrls[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/viewQuote',
                                arguments: {'img': imgUrls[index],'imgLength':imgUrls.length,'imgIndex':index});
                          },
                        )));
              },
              staggeredTileBuilder: (index) {
                return new StaggeredTile.count(1, index.isEven ? 1.0 : 1.2);
              })),
    );
  }
}
