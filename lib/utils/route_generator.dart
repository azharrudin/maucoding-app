import 'package:flutter/material.dart';
import 'package:greetings_ai/main.dart';
import 'package:greetings_ai/screens/people/add_edit_view_people.dart';
import 'package:greetings_ai/screens/people/people_list.dart';
import 'package:greetings_ai/screens/settings/settings.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => ScreenContainer());
      case '/people':
        return MaterialPageRoute(builder: (_) => People());
      case '/people/edit_view':
        return MaterialPageRoute(
            builder: (_) => AddEditViewPeople(
                  personId: args as int,
                  newPerson: false,
                ));
      case '/people/add':
        return MaterialPageRoute(
            builder: (_) => AddEditViewPeople(personId: 0, newPerson: true));
      case '/settings':
        return MaterialPageRoute(builder: (_) => Settings());

      default:
    }
    return MaterialPageRoute(builder: (_) => ScreenContainer());
  }
}
