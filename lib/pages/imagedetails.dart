// ignore_for_file: must_be_immutable

import 'package:fimage/style.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageDetails extends StatefulWidget {
  List<String> imageDetails;
  //[0] - url of image
  //[1] - width of image
  //[2] - height of image
  //[3] - author of image
  ImageDetails({Key? key, required this.imageDetails}) : super(key: key);

  @override
  State<ImageDetails> createState() => _ImageDetailsState();
}

class _ImageDetailsState extends State<ImageDetails> {
  bool isLiked = false;

  Future<void> checkIfLiked(String url) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? listOfDetails = pref.getStringList(url);
    if (listOfDetails != null && listOfDetails[0] == 'true') {
      isLiked = true;
    } else {
      isLiked = false;
    }
  }

  Future<void> likeImage(String url) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    if (isLiked) {
      pref.remove(url);
      isLiked = false;
    } else {
      pref.setStringList(url, <String>[
        'true',
        widget.imageDetails[1],
        widget.imageDetails[2],
        widget.imageDetails[3]
      ]);
      isLiked = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Details'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppStyle.secondColor,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: checkIfLiked(widget.imageDetails[0]),
            builder: (context, snapshot) {
              return Column(
                children: [
                  Image.network(
                    widget.imageDetails[0],
                  ),
                  IconButton(
                      iconSize: 100,
                      onPressed: () {
                        likeImage(widget.imageDetails[0]);
                      },
                      icon: !isLiked
                          ? Icon(
                              Icons.favorite_outline,
                              color: AppStyle.whiteColor,
                            )
                          : Icon(
                              Icons.favorite,
                              color: AppStyle.whiteColor,
                            )),
                  DisplayDetailText(
                      detail: 'Original width: ${widget.imageDetails[1]}'),
                  DisplayDetailText(
                      detail: 'Original height: ${widget.imageDetails[2]}'),
                  DisplayDetailText(detail: 'Author: ${widget.imageDetails[3]}')
                ],
              );
            }),
      ),
    );
  }
}

class DisplayDetailText extends StatelessWidget {
  String detail;
  DisplayDetailText({Key? key, required this.detail}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        detail,
        style: AppStyle.mainText,
      ),
    );
  }
}
