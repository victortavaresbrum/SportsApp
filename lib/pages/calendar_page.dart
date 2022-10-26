import 'package:flutter/material.dart';

import '../resources/strings.dart';


class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
     return Center(
        child: Text(Strings.calendar),
    );
  }
}