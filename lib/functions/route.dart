import 'package:flutter/material.dart';

class MyRoute{
 static goAndBack(context,Widget page){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>page));
  }
}