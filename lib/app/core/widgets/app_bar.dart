import 'package:flutter/material.dart';

AppBar transparentAppBar({
  Widget? title,
  Widget? leading,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: Color.fromARGB(255,124,104,243),
    foregroundColor: Colors.black,
    elevation: 0,
    title: title != null ? Center(child: title) : null,
    leading: leading,
    actions: actions,
  );
}