import 'package:flutter/material.dart';
import 'package:frontend/services/room_service.dart';

class CreateRoomScreen extends StatelessWidget {
  CreateRoomScreen({super.key});

  final roomNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('방 생성'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text('build'),
          TextField(
            controller: roomNameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Room name',
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {
              var roomName = roomNameController.text;
              // 서버에 데이터 전송 작성 (id 생성 + roomName 데이터)
              RoomService.createRoom(roomName);
              Navigator.pop(context);
            },
            child: const Text('방 생성하기'),
          ),
        ],
      ),
    );
  }
}
