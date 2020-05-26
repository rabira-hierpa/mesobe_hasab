import 'package:flutter/material.dart';
class GalleryPage extends StatefulWidget {
  int page;
  GalleryPage({this.page});
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
//  double page;
//  _GalleryPageState({this.page});
  PageController pageController;
  List<String> imgUrls = [];
  void initState(){
    super.initState();
    pageController= PageController(initialPage: widget.page,viewportFraction: 1);
    for (var i = 1; i <= 31; i++) {
      imgUrls.add("assets/quotes/$i.jpg");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
          controller: pageController,
          itemCount: imgUrls.length,
          itemBuilder: (context,position){
            return imageSlider(position);
          }),
    );
  }

  Widget imageSlider(int position) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context,widget){
        return Center(
          child: SizedBox(

            child: widget,
          ),
        );
      },
      child: Container(
        color: Colors.black,
        child: Image.asset(imgUrls[position],fit: BoxFit.cover,
        ),

      ),
    );
  }
}