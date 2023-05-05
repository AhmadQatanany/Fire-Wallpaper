// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../functions/route.dart';
import '../../screens/photo_view.dart';

class BuilderFavorites extends StatelessWidget {
  var data;
  BuilderFavorites({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: .5),
      itemCount: data.imagesFaborites.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            MyRoute.goAndBack(
                context,
                MyPhotoView(
                  image: data.imagesFaborites[index],
                  where: 3,
                ));
          },
          child: Image.network(
            data.imagesFaborites[index],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
