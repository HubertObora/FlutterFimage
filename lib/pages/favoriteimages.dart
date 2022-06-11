// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'imagedetails.dart';

class FavoriteImages extends StatefulWidget {
  const FavoriteImages({Key? key}) : super(key: key);

  @override
  State<FavoriteImages> createState() => _FavoriteImagesState();
}

class _FavoriteImagesState extends State<FavoriteImages> {
  Set<String> photos = {};
  Future<Set<String>> getLikedPhotos() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    photos = pref.getKeys();
    return photos;
  }

  Future<List<String>?> getPhotosDetails(String url) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    // [0] - is photo liked  [1] - width [2] - height [3] - author
    return pref.getStringList(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getLikedPhotos(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: photos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title:
                          Image(image: NetworkImage(photos.elementAt(index))),
                      onTap: () async {
                        List<String>? imageDetails =
                            await getPhotosDetails(photos.elementAt(index));
                        List<String> imgDetails = [
                          photos.elementAt(index),
                          imageDetails![1],
                          imageDetails[2],
                          imageDetails[3]
                        ];
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImageDetails(
                                    imageDetails: imgDetails,
                                  )),
                        ).then((value) => setState(() {}));
                      },
                    );
                  });
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
