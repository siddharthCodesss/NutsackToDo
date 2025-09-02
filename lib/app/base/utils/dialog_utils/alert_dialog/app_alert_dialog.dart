import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutsacktodo/app/base/theme/theme_manager.dart';
import 'package:nutsacktodo/app/base/utils/dialog_utils/custom_dialog.dart';

class AppAlertDialog extends StatefulWidget {
  final String? message;
  final Function() onOKTap;

  AppAlertDialog(this.message, this.onOKTap);

  @override
  _AppAlertDialogState createState() => _AppAlertDialogState(message, onOKTap);
}

class _AppAlertDialogState extends State<AppAlertDialog> {
  final String? message;
  final Function() onOKTap;

  _AppAlertDialogState(this.message, this.onOKTap);

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      showPadding: false,
      child: buildDialogContent(context),
    );
  }

  Widget buildDialogContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.padding_16dp),
      constraints: BoxConstraints(
        maxWidth: Dimensions.alert_dialog_max_width,
      ),
      decoration: BoxDecoration(
        //color: AppColors.secondary,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(Dimensions.radius_8dp),
        /*boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: Dimens.radius_8dp,
            offset: const Offset(0.0, 8.0),
          ),
        ],*/
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          //SizedBox(height: Dimens.margin_8dp),
          //Image.asset('assets/images/ns_logo_white.png'/*, height: 50*/),
          SizedBox(height: Dimensions.margin_8dp),
          Text(
            message!,
            textAlign: TextAlign.center,
            style: context.textTheme.headlineMedium,
          ),

          SizedBox(height: Dimensions.margin_16dp),
          //buildSaveButton(context),
          buildCancelButton(context),
          //SizedBox(height: Dimens.margin_8dp),
        ],
      ),
    );
  }

  /*Widget buildSaveButton(BuildContext context) {
    return RaisedRectButton(
      text: 'Save',
      textColor: AppColors.white,
      onPressed: () {},
      //backgroundColor: AppColors.white,
      //borderColor: AppColors.lightGrey,
    );
  }*/

  Widget buildCancelButton(BuildContext context) {
    return SizedBox();/*
    return RaisedRectButton(
      text: 'OK',
      textColor: AppColors.white,
      onPressed: onOKTap,
      //backgroundColor: AppColors.colorAccent,
      //borderColor: AppColors.lightGrey,
    );*/
  }
}
