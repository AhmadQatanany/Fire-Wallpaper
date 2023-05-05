import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fireimage/cubit/image_cubit.dart';
import 'package:fireimage/widgets/home/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ImageCubit, ImageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var data = ImageCubit().get(context);
        return Scaffold(
          body: ConditionalBuilder(
            //condition of builder home page
            condition: data.imageModel.photos?.length != null,

            //builder home page
            builder: (context) => BuilderHomePage(data: data),

            //fallback home page
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
