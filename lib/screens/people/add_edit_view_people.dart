import 'package:flutter/material.dart';

class AddEditViewPeople extends StatelessWidget {
  const AddEditViewPeople({Key? key, personId, newPerson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("s")),
      body: SafeArea(
        child: Column(children: [
          Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Add or Edit!',
              style: _textTheme.headline1,
            ),
          ),
        ]),
      ),
    );
  }
}
