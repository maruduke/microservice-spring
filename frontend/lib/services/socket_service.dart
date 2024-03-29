import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/models/message.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class SocketService {
  late final StompClient stompClient;
  late final int topic;

  final String url = 'http://localhost:8080';
  final String service = 'stomp';
  final String endPoint = 'ws/chat';

  SocketService() {
    // websocket 연결과 동시에 topic 추가
    stompClient = StompClient(
      config: StompConfig.sockJS(
        url: '$url/$service/$endPoint',
        webSocketConnectHeaders: {
          "transports": ["websocket"]
        },
        onConnect: onConnect,
        onDisconnect: onDisconnect,
      ),
    );
  }

  void activate() {
    // websocket 연결
    stompClient.activate();
  }

  void deactivate() {
    stompClient.deactivate();
  }

  void onConnect(StompFrame stompFrame) {
    // 연결 함수
    print(stompFrame.headers['session']);
    debugPrint("Connect Server");
  }

  void onDisconnect(StompFrame stompFrame) {
    debugPrint('Disconnect Server');
  }

  void subscribe(int topic, Function receive) {
    // topic 구독 및 해당 토픽에서 데이터 수신 시 callback 함수 수행

    stompClient.subscribe(
      destination: '$url/$service/topic/$topic',
      callback: (frame) => receive(frame),
    );
  }

  void send(Message message) {
    // 메시지 전송
    stompClient.send(
      destination: '$url/$service/api/chat/message',
      body: jsonEncode(message.toJson()),
      headers: {},
    );
  }
}
