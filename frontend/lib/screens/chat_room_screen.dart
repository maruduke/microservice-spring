import 'package:flutter/material.dart';
import 'package:frontend/models/message.dart';
import 'package:frontend/services/socket_service.dart';
import 'package:frontend/widgets/message_box.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class ChatRoomScreen extends StatefulWidget {
  final String roomName;
  final int roomId;

  const ChatRoomScreen({
    super.key,
    required this.roomName,
    required this.roomId,
  });

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final SocketService socketService = SocketService();
  List<Message> messages = [];

  void receiveMessage(StompFrame frame) {}

  @override
  void initState() {
    super.initState();
    socketService.subscribe(widget.roomId, receiveMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      appBar: AppBar(
        title: Text(widget.roomName),
      ),
      body: Column(children: [Flexible(child: makeList(messages))]),
    );
  }

  ListView makeList(List<Message> messages) {
    return ListView.separated(
        reverse: false,
        itemCount: messages.length,
        itemBuilder: (context, index) {
          if (messages.isNotEmpty) {}

          return const Text('새로운 메시지를 입력해 보세요.');
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        });
  }
}
