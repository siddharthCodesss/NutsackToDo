import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/internet_cubit.dart';
import 'cubit/internet_state.dart';



class InternetSensitive extends StatelessWidget {
  final Widget child;

  InternetSensitive({required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetCubit, InternetState>(
      builder: (internetCubitBuilderContext, state) {
        if (kIsWeb) {
          return child;
        } else if (state is InternetGainedState) {
          return child;
        } else if (state is InternetLostState) {
          return buildNoInternetUI(context);
        }
        return buildProgressUI(context);
      },
    );
  }

  Widget buildNoInternetUI(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          Text('No Internet Connection!', style: TextStyle(fontSize: 40)),
          SizedBox(height: 4),
          Text('Please try to connect with internet.',
              style: TextStyle(fontSize: 40))
        ],
      ),
    );
  }

  Widget buildProgressUI(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          Text('This is progress bar', style: TextStyle(fontSize: 40)),
        ],
      ),
    );
  }


}
