import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main()=> runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: ImageFromNetwork(),
));

class ImageFromNetwork extends StatefulWidget {
  @override
  _ImageFromNetworkState createState() => _ImageFromNetworkState();
}

class _ImageFromNetworkState extends State<ImageFromNetwork> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Network Image'),
      ),
      body: Container(
        child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder:(BuildContext context, int index)=> CachedNetworkImage(
              imageUrl: 'https://loremflickr.com/200/200/music?lock=$index',
              placeholder: _loader,
              errorWidget: _error,
            ),
        ),
      ),
    );
  }

  Widget _loader(BuildContext context,String url){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _error(BuildContext context,String url, dynamic error){
    print(error);
    return Center(
      child: Icon(Icons.error_outline),
    );
  }

}

