import 'package:pod_player/pod_player.dart';
import 'package:flutter/material.dart';

class PlayVideoFromNetwork extends StatefulWidget {
  final Map objdata;

  const PlayVideoFromNetwork({Key? key, required this.objdata})
      : super(key: key);

  @override
  State<PlayVideoFromNetwork> createState() =>
      _PlayVideoFromNetworkState(this.objdata);
}

class _PlayVideoFromNetworkState extends State<PlayVideoFromNetwork> {
  Map objdata;
  _PlayVideoFromNetworkState(this.objdata);
  bool isExpandedDesc = false;

  late final PodPlayerController controller;
  @override
  void initState() {
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.network(
        'https://samplelib.com/lib/preview/mp4/sample-5s.mp4',
      ),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(objdata["attributes"]["title"],
            style: TextStyle(
                color: Theme.of(context).textTheme.headlineSmall?.color)),
        centerTitle: true,
        leading: BackButton(
            color: Colors.grey, onPressed: () => Navigator.pop(context)),
        backgroundColor: Theme.of(context).colorScheme.surface,
        shadowColor: Colors.transparent,
      ),
      body: Container(
          height: MediaQuery.of(context).size.height - 136,
          width: MediaQuery.of(context).size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                PodVideoPlayer(controller: controller),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: ExpansionPanelList(
                        expansionCallback: (panelIndex, isExpanded) {
                          setState(() {
                            if (isExpandedDesc == true) {
                              isExpandedDesc = false;
                            } else
                              isExpandedDesc = true;
                          });
                        },
                        children: [
                          ExpansionPanel(
                              headerBuilder: (context, isExpanded) {
                                return Padding(
                                    padding: EdgeInsets.fromLTRB(14, 10, 0, 0),
                                    child: Text(objdata["attributes"]["title"],
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontFamily: "Lato",
                                            fontSize: 20,
                                            color: Theme.of(context)
                                                .textTheme
                                                .headlineSmall
                                                ?.color)));
                              },
                              isExpanded: isExpandedDesc,
                              canTapOnHeader: true,
                              body: ListTile(
                                  contentPadding: EdgeInsets.only(
                                      bottom: 10, left: 14, right: 10),
                                  title: Text(
                                      objdata["attributes"]["description"],
                                      style: TextStyle(fontSize: 16))))
                        ])),
                Expanded(
                    child: SingleChildScrollView(
                  padding: EdgeInsets.all(14),
                  child: Column(children: [
                    Text(objdata["attributes"]["content"],
                        style: TextStyle(fontSize: 16))
                  ]),
                ))
              ])),
    );
  }
}
