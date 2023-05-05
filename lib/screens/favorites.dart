import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fireimage/cubit/image_cubit.dart';
import 'package:fireimage/widgets/favorites/appbar_favorites.dart';
import 'package:fireimage/widgets/favorites/builder_favorites.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ImageCubit, ImageState>(
      listener: (context, state) {},
      builder: (context, state) {
        var data = ImageCubit().get(context);
        return Scaffold(
          backgroundColor: Colors.white,

          //appbar favorites
          appBar: const AppBarFavorites(),

          //body favorites page
          body: ConditionalBuilder(
            condition: data.imagesFaborites.isNotEmpty,

            //condition favorites page
            builder: (context) => BuilderFavorites(data: data),

            //fallback favorites page
            fallback: (context) =>
                Center(child: Image.asset("assets/images/99403-love.gif")),
          ),
        );
      },
    );
  }
}
