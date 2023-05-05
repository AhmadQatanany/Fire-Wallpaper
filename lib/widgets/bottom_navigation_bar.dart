// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyBottomNavigationBar extends StatelessWidget {
  var data;
  MyBottomNavigationBar({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
            backgroundColor: Colors.black,
            selectedItemColor: Color.fromARGB(255, 255, 17, 0),
            unselectedItemColor: Colors.white,
            items: data.item,
            currentIndex: data.index,
            onTap: (value) => data.changeIndex(value),
          );
  }
}
