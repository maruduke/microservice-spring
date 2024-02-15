import 'package:flutter/material.dart';
import 'package:frontend/services/socket_service.dart';

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

  @override
  void initState() {
    super.initState();
    socketService.subscribe(widget.roomId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.roomName),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 2.0),
        child: Row(children: []),
      ),
    );
  }
}
