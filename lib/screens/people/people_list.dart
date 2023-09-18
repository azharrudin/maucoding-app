import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:getwidget/getwidget.dart';
import '../internal/connection.dart';
import '../internal/components_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:core';
import 'course_activity.dart';

class People extends StatefulWidget {
  const People({
    Key? key,
  }) : super(key: key);

  @override
  _People createState() => _People();
}

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

class _People extends State<People> {
  //const NoteContainer({Key? key}) : super(key: key);
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> cardData = [
    "Card 1",
    "Card 2",
    "Card 3",
    "Card 4",
    // Add more data as needed
  ];
  late Future<Object> course;
  Connection objConn = new Connection();

  @override
  void initState() {
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
            title: Text('Belajar',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                    color: Theme.of(context).textTheme.headlineMedium?.color)),
            backgroundColor: Theme.of(context).colorScheme.surface,
            shadowColor: Colors.transparent,
            actions: [
              ImageFromUrl(
                  imageUrl: objConn.config_host +
                      "/uploads/thumbnail_fc53075938285de5eceb2fa1609281d9_0dc6949c74.jpg"), // http://localhost:1337/uploads/thumbnail_fc53075938285de5eceb2fa1609281d9_0dc6949c74.jpg
            ]),
        body: Container(
            color: Theme.of(context).colorScheme.background,
            child: SafeArea(
              child: SingleChildScrollView(
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment
                              .start, // Align children to the top
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Center children horizontally

                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 14, left: 14, right: 14),
                                child: TextField(
                                  style: TextStyle(fontSize: 14),
                                  controller: _searchController,
                                  decoration: InputDecoration(
                                    hintText: 'Cari kursus...',
                                    // Add a clear button to the search bar

                                    prefixIcon: IconButton(
                                      icon: Icon(Icons.search),
                                      onPressed: () {},
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(top: 10, left: 10),
                                child: Text("Yang paling gampang! ",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins",
                                      fontSize: 14,
                                    ))),

                            Container(
                                height: 280,
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                child: Expanded(
                                    child: FutureBuilder(
                                        future: objConn.fetchCourse(),
                                        builder: ((context, snapshot) {
                                          var obj;
                                          var listcount;
                                          var totalCourse;
                                          if(snapshot.connectionState == ConnectionState.done){
                                            
                                          }

                                          if (snapshot.hasData) {
                                            obj = snapshot.data!;
                                            listcount = (obj as Map);
                                            totalCourse = listcount['meta']
                                                ['pagination']['total'];
                                          } else {
                                            totalCourse = 0;
                                          }

                                          return snapshot.hasError ? new MAComponents().showFetchError("Tidak bisa mengambil data dari server", snapshot.hasError) : new MAComponents().gridCourse(totalCourse, listcount);
                                               
                                        })))),
                            Padding(
                                padding: EdgeInsets.only(top: 10, left: 10),
                                child: Text("Trik dan Tips",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins",
                                      fontSize: 14,
                                    ))),
                          ]))),
            )));
  }
}
