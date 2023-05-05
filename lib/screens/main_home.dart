import 'package:fireimage/cubit/image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../widgets/appbar_home.dart';
import '../../widgets/bottom_navigation_bar.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ImageCubit, ImageState>(
      listener: (context, state) {      },
      builder: (context, state) {
        var data = ImageCubit().get(context);
        return Scaffold(
          backgroundColor: Colors.black,
         
          //AppBar Home Page
          appBar: data.index == 0
              ? AppBarHome(data: data)
              : null,
         
          //Page Bottom NavigationBar    
          body: data.pageindex[data.index],
         
          //Bottom NabigationBar
          bottomNavigationBar: MyBottomNavigationBar(data: data,),
        );
      },
    );
  }
}
