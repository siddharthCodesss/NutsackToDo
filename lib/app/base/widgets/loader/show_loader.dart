import 'package:flutter/material.dart';
import 'package:nutsacktodo/app/base/utils/dialog_utils/loading/app_circular_progress_indicator.dart';

class ShowLoader extends StatelessWidget {
  const ShowLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: AppCircularProgressIndicator(),
      ),
    );
  }
}
