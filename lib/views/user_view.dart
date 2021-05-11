import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  final List<Widget> userMenuItems = [
    ListTile(
          title: Text(
            'hahaha',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        ListTile(
          title: Text(
            'hehehe',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        ListTile(
          title: Text(
            'hohoho',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: userMenuItems.length,
      itemBuilder: (context, i) {
        if (i.isOdd) {
          return Divider();
        }
        final index = i ~/ 2;
        return userMenuItems[index];
      });
  }
}
