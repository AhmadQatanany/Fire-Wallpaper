import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fireimage/cubit/image_cubit.dart';
import 'package:fireimage/widgets/search/appbar_search.dart';
import 'package:fireimage/widgets/search/builder_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatelessWidget {
  Search({super.key});
  TextEditingController text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ImageCubit, ImageState>(
      listener: (context, state) {},
      builder: (context, state) {
        var data = ImageCubit().get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          //appbar search
          appBar:AppBarSearch(text: text, data: data) ,

          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              //in no search builder
              data.searchList.isEmpty
                  ? ListView(
                      physics:const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Image.asset("assets/images/41252-searching-radius.gif"),
                      ],
                    )

                    // in yes search builder
                  : ConditionalBuilder(
                      condition: data.searchList.length > 0,
                      builder: (context) => BuilderSearch(data: data),
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator()),
                    ),
            ],
          ),
        );
      },
    );
  }
}
