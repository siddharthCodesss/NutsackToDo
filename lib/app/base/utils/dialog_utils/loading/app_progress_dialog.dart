import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart' as con;
import 'package:nutsacktodo/app/base/constants/color_constants.dart';
import 'package:nutsacktodo/app/base/theme/theme_manager.dart';
import 'package:nutsacktodo/app/base/utils/dialog_utils/loading/app_circular_progress_indicator.dart';
import 'package:nutsacktodo/app/base/utils/helper_util.dart';

String? _dialogMessage = "Loading...";

enum ProgressDialogType { Normal, Download }

ProgressDialogType _progressDialogType = ProgressDialogType.Normal;
double? _progress = 0.0;

bool _isShowing = false;

class AppProgressDialog {
  _MyDialog? _dialog;

  BuildContext? _buildContext, _context;

  AppProgressDialog(
      BuildContext buildContext, ProgressDialogType progressDialogtype) {
    _buildContext = buildContext;

    _progressDialogType = progressDialogtype;
  }

  void setMessage(String mess) {
    _dialogMessage = mess;
    printWrapped("AppProgressDialog message changed: $mess");
  }

  void update({double? progress, String? message}) {
    printWrapped("AppProgressDialog message changed: ");
    if (_progressDialogType == ProgressDialogType.Download) {
      printWrapped("Old Progress: $_progress, New Progress: $progress");
      _progress = progress;
    }
    printWrapped("Old message: $_dialogMessage, New Message: $message");
    _dialogMessage = message;
    _dialog!.update();
  }

  bool isShowing() {
    return _isShowing;
  }

  void hide() {
    if (_isShowing) {
      _isShowing = false;
      if (_context == null) {
        Get.back();
      } else {
        Navigator.of(_context!).pop();
      }
      printWrapped('AppProgressDialog dismissed');
    }
  }

  void show() {
    if (!_isShowing) {
      _dialog = _MyDialog();
      _isShowing = true;
      printWrapped('AppProgressDialog shown');
      showDialog<dynamic>(
        context: _buildContext!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          _context = context;
          return Dialog(
              insetAnimationCurve: Curves.easeInOut,
              insetAnimationDuration: Duration(milliseconds: 100),
              elevation: Dimensions.elevation_8dp,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(Dimensions.radius_8dp))),
              child: _dialog);
        },
      );
    }
  }

  void showLoadingDialog(String message) {
    if (!_isShowing) {
      _isShowing = true;
      printWrapped('AppProgressDialog shown');
      showDialog<dynamic>(
        context: _buildContext!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          _context = context;
          return Dialog(
            backgroundColor: ColorConstants.primaryColor,
            insetAnimationCurve: Curves.easeInOut,
            insetAnimationDuration: const Duration(milliseconds: 100),
            elevation: Dimensions.elevation_8dp,
            shape: const RoundedRectangleBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(Dimensions.radius_10dp))),
            child: Container(
              // color: AppColors.appContainerColor,
              width: 100,
              height: 100,
              child: Center(
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AppCircularProgressIndicator(),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }
}

// ignore: must_be_immutable
class _MyDialog extends StatefulWidget {
  final _dialog = _MyDialogState();

  update() {
    _dialog.changeState();
  }

  @override
  // ignore: must_be_immutable
  State<StatefulWidget> createState() {
    return _dialog;
  }
}

class _MyDialogState extends State<_MyDialog> {
  changeState() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _isShowing = false;
    printWrapped('AppProgressDialog dismissed by back button');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Row(
        children: <Widget>[
          const SizedBox(width: Dimensions.margin_16dp),
          Expanded(
            child: _progressDialogType == ProgressDialogType.Normal
                ? buildNormalDialog()
                : Stack(
              children: <Widget>[
                Positioned(
                  top: 35.0,
                  child: Text(_dialogMessage!,
                      style: context.textTheme.headlineLarge),
                ),
                PositionedDirectional(
                  bottom: 15.0,
                  end: 15.0,
                  child: Text("$_progress/100",
                      style: context.textTheme.headlineLarge),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildNormalDialog() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AppCircularProgressIndicator(),
          const SizedBox(height: Dimensions.margin_8dp),
          Text(
            _dialogMessage!,
            textAlign: TextAlign.center,
            style: context.textTheme.headlineMedium,
          )
        ],
      ),
    );
  }
}

class MessageBox {
  BuildContext buildContext;
  String message = " ";
  String title = " ";

  MessageBox(this.buildContext, this.message, this.title);

  void show() {
    _showDialog();
  }

  Future? _showDialog() {
    showDialog(
      context: buildContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Ok"),
            )
          ],
          content: SizedBox(
            height: 45.0,
            child: Center(
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: context.textTheme.headlineMedium,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                ],
              ),
            ),
          ),
        );
      },
    );
    return null;
  }
}
