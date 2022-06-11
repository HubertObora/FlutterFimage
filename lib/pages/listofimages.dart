import 'package:fimage/pages/imagedetails.dart';
import 'package:fimage/style.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ListOfImages extends StatefulWidget {
  const ListOfImages({Key? key}) : super(key: key);
  @override
  State<ListOfImages> createState() => _ListOfImagesState();
}

class _ListOfImagesState extends State<ListOfImages> {
  List data = [];
  bool showimages = false;
  @override
  void initState() {
    super.initState();
    getImagesData();
  }

  getImagesData() async {
    try {
      var url = Uri.parse(
          "https://api.unsplash.com/photos/?client_id=svOnkHKQYCRiRgctxHJKcghtA_EOUDHYORWPMExEMsg");
      final res = await http.get(url);
      setState(() {
        data = jsonDecode(res.body);
        showimages = true;
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: const EdgeInsets.all(15),
          title: !showimages
              ? Text(
                  'Loading...',
                  style: AppStyle.mainText,
                )
              : Image(image: NetworkImage(data[index]['urls']['full'])),
          onTap: (() {
            var imageDetails = [
              data[index]['urls']['full'].toString(),
              data[index]['width'].toString(),
              data[index]['height'].toString(),
              data[index]['user']['name'].toString(),
            ];
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ImageDetails(
                        imageDetails: imageDetails,
                      )),
            );
          }),
        );
      },
    ));
  }
}
