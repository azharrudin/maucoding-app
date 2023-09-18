import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:getwidget/getwidget.dart';
import '../internal/connection.dart';
import '../internal/components_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:core';
import '../people/course_activity.dart';

class ImageFromUrl extends StatelessWidget {
  final String imageUrl;

  ImageFromUrl({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.fill,
      height: 120,
      width: 40,

      placeholder: (context, url) =>
          CircularProgressIndicator(), // Placeholder while loading
      errorWidget: (context, url, error) =>
          Icon(Icons.error), // Widget to display when there's an error
    );
  }
}

class MAComponents {

  late Future<Object> course;
  Connection objConn = new Connection();

  Widget showFetchError(String msg, bool cond) {
    return Visibility(
      child: Padding(
          child: Text("Tidak bisa mengambil data dari server",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 14,
              )),
          padding: EdgeInsets.all(15)),
      visible: cond,
    );
  }

  Widget gridCourse(int totalCourse, Map listcount, ) {
    return GridView.builder(
        // Set the scroll direction to horizontal
        itemCount: totalCourse,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 4 / 3,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  PlayVideoFromNetwork(objdata: listcount["data"][index]),
            )),
            child: SizedBox(
                child: Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 1, // Adjust the elevation as needed

                    child: ListView(
                      children: <Widget>[
                        ImageFromUrl(
                            imageUrl: objConn.config_host +
                                listcount["data"][index]["attributes"]["video"]
                                    ["data"]["attributes"]["url"]),
                        Card(
                            margin: EdgeInsets.zero,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10))),
                            child: Container(
                                color: Colors.orange,
                                child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                        listcount["data"][index]["attributes"]
                                            ["course_level"],
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Lato",
                                          fontSize: 14,
                                        ))))),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              listcount["data"][index]["attributes"]["title"],
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Poppins",
                                fontSize: 14,
                              ),
                            )),
                      ],
                    ))),
          );
        });
  }
}
