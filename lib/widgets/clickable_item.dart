import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show SystemMouseCursors;

class ClickableItem extends StatelessWidget {
  final Widget child;

  const ClickableItem({
    @required this.child,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: child,
    );
  }
}
