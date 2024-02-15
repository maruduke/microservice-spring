import 'package:flutter/material.dart';
import 'package:frontend/services/room_service.dart';

class CreateRoomScreen extends StatelessWidget {
  CreateRoomScreen({super.key});

  final roomNameController = TextEditingController();

  final RoomService roomService = RoomService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('방 생성'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Row(
          children: [
            TextField(controller: roomNameController),
            TextButton(
              onPressed: () {
                var roomName = roomNameController.text;
                // 서버에 데이터 전송 작성 (id 생성 + roomName 데이터)
                roomService.createRoom(roomName);
                Navigator.pop(context);
              },
              child: const Text('방 생성하기'),
            ),
          ],
        ),
      ),
    );
  }
}
