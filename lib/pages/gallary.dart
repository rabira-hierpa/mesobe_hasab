import 'package:flutter/material.dart';
class GalleryPage extends StatefulWidget {
  int page;
  int length;
  int index;
  GalleryPage({this.page,this.length,this.index});
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {

  PageController pageController;
  List<String> imgUrls = [];
  void initState(){
    super.initState();
    pageController= PageController(initialPage: widget.page,viewportFraction: 1);
  }
  @override
  Widget build(BuildContext context) {
    Map imageData = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
          controller: pageController,
          itemCount: imageData['length'],
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