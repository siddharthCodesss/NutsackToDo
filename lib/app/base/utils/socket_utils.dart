/*
import 'dart:async';
import 'dart:convert';

import 'package:collective/main.dart';
import 'package:collective/src/base/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../ui/auth/signin/model/res_user_model.dart';
import 'constants/api_constants.dart';
import 'constants/api_params.dart';
import 'constants/preference_key_constants.dart';
import 'preference_utils.dart';

class SocketIOManager {
  Socket? socketInstance;
  StreamController<dynamic> muteUnmuteStream = StreamController.broadcast();
  StreamController<dynamic> onNewMessagesStream = StreamController.broadcast();
  StreamController<dynamic> onConversationsStream =
      StreamController.broadcast();
  StreamController<dynamic> onChatHistoryStream = StreamController.broadcast();
  StreamController<dynamic> onReadChatStream = StreamController.broadcast();
  StreamController<dynamic> onGetMessagesStream = StreamController.broadcast();
  BuildContext? buildContext;
  User? mUserData;

  SocketIOManager() {
    if (socketInstance != null) return;
    socketInstance = io(
        config.apiSocketBaseUrl +
            "?authorization=${getString(PreferenceKeyConstants.prefKeyToken)}",
        OptionBuilder()
            .setTransports(['websocket', "polling"])
            .enableForceNew() // for Flutter or Dart VM
            .build());
    socketInstance!.connect();
    mUserData = User.fromJson(
        json.decode(getString(PreferenceKeyConstants.prefKeyUserData)));
    socketGlobalListeners();
  }

  dynamic setRootContext() {}

  dynamic reInitializeAndConnectSocket() {
    disconnectSocket();
    SocketIOManager();
  }

  dynamic disconnectSocket() {
    socketInstance?.clearListeners();
    socketInstance?.disconnect();
    socketInstance = null;
  }

  dynamic socketGlobalListeners() {
    socketInstance!.on("connect", onConnect);
    socketInstance!.on("disconnect", onDisconnect);
    socketInstance!.on("error", onConnectError);
    socketInstance!.on(ApiConstants.onNewMessages, handleOnNewMessagesStream);
    socketInstance!
        .on(ApiConstants.onConversationLists, handleOnConversationsStream);
    socketInstance!.on(ApiConstants.onChatHistory, handleOnChatHistoryStream);
    socketInstance!.on(ApiConstants.onGetMessages, handleOnChatHistoryStream);
    socketInstance!.on(ApiConstants.onIsReadChat, handleOnReadChatStream);
    socketInstance!.on('reconnect', onReConnect);
    socketInstance!.on('reconnect_attempt', onReConnectAtmp);
    socketInstance!.on('reconnect_failed', onReConnectFailed);
    socketInstance!.on('reconnect_error', onReConnectError);
    socketInstance!.on('reconnecting', onReConnecting);
  }

  dynamic deInitialize() {
    disconnectSocket();
    socketInstance = null;
  }

  bool isConnected() {
    if (socketInstance != null) {
      return socketInstance!.connected;
    }
    return false;
  }

  bool emitNewMessages(Map<String, dynamic> data) {
    debugPrint("emitNewMessages....................$data");
    socketInstance!
        .emit(ApiConstants.emitNewMessages, jsonDecode(json.encode(data)));
    if (!socketInstance!.connected) socketInstance!.connect();
    return socketInstance!.connected;
  }

  bool emitConversations(Map<String, dynamic> data) {
    debugPrint(
        "emitConversations....................$data====${DateTime.now()}");
    socketInstance!.emit(
        ApiConstants.emitConversationLists, jsonDecode(json.encode(data)));
    return socketInstance!.connected;
  }

  bool emitChatHistory(Map<String, dynamic> data) {
    socketInstance!
        .emit(ApiConstants.emitChatHistory, jsonDecode(json.encode(data)));
    if (!socketInstance!.connected) socketInstance!.connect();
    return socketInstance!.connected;
  }

  bool emitReadChat(Map<String, dynamic> data) {
    debugPrint("emitReadChat....................$data====${DateTime.now()}");
    socketInstance!
        .emit(ApiConstants.emitIsReadChat, jsonDecode(json.encode(data)));
    if (!socketInstance!.connected) socketInstance!.connect();
    return socketInstance!.connected;
  }

  bool emitGetMessages(Map<String, dynamic> data) {
    socketInstance!
        .emit(ApiConstants.emitGetMessages, jsonDecode(json.encode(data)));
    return socketInstance!.connected;
  }

  dynamic onConnect(_) {
    debugPrint("connected socket....................");
  }

  dynamic onReConnect(_) {
    debugPrint("reconnected socket....................$_");
  }

  dynamic onReConnectAtmp(_) {
    debugPrint("reconnected atemp socket....................$_");
  }

  dynamic onReConnectFailed(_) {
    debugPrint("reconnected reconnect_failed socket....................$_");
  }

  dynamic onReConnectError(_) {
    debugPrint("reconnected reconnect_error socket....................$_");
  }

  dynamic onReConnecting(_) {
    debugPrint("reconnected reconnecting socket....................$_");
  }

  dynamic onDisconnect(_) {
    debugPrint("Disconnected socket....................");
    socketInstance!.connect();
  }

  dynamic onConnectError(_) {
    debugPrint("ConnectError socket....................");
    socketInstance!.connect();
  }

  void handleOnNewMessagesStream(dynamic data) {
    debugPrint("handleEmitNewMessagesStream....................$data");
    onNewMessagesStream.add(data);
    if (AppConstants.navigatorKeyChatDeatil.currentState != null) {
    } else {
      emitConversations({ApiParams.paramUserId: mUserData?.sId});
    }
  }

  void handleOnConversationsStream(dynamic data) {
    debugPrint("handleOnConversationsStream....................$data");
    onConversationsStream.add(data);
  }

  void handleOnChatHistoryStream(dynamic data) {
    debugPrint("handleOnReadChatStream....................$data");
    onChatHistoryStream.add(data);
  }

  void handleOnReadChatStream(dynamic data) {
    debugPrint("handleOnReadChatStream....................$data");
    onReadChatStream.add(data);
  }
}
*/
