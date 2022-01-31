import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_fintech/cubits/app_cubit_states.dart';
import 'package:green_fintech/cubits/app_cubits.dart';
import 'package:green_fintech/pages/navpages/home_page.dart';
import 'package:green_fintech/pages/welcome_page.dart';

class AppCubitsLogics extends StatefulWidget {
  const AppCubitsLogics({Key? key}) : super(key: key);

  @override
  _AppCubitsLogicsState createState() => _AppCubitsLogicsState();
}

class _AppCubitsLogicsState extends State<AppCubitsLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return Center(
              child: WelcomePage(),
            );
          } else if (state is LoadedState) {
            return WeatherHomePage();
          } else if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
