import 'package:flutter/material.dart';
import 'package:frontend/models/room_data.dart';
import 'package:frontend/screens/chat_room_screen.dart';
import 'package:frontend/screens/create_room_screen.dart';
import 'package:frontend/services/room_service.dart';

// 대화 room 보여주기
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Future<List<Room>> rooms = RoomService.getRooms();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateRoomScreen(),
                    ),
                  ).then((value) {
                    setState(() {});
                  });
                },
                child: const Text('New Chat Room'),
              ),
            ],
          )
        ],
      ),
      body: FutureBuilder(
        future: rooms,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Text('test'); // 수정 chatroombox
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('목록 로딩 에러 발생'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<Room>> snapshot) {
    return ListView.separated(
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        Room room = snapshot.data![index];

        return TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatRoomScreen(
                    roomName: room.roomName, roomId: room.roomId),
              ),
            );
          },
          child: Text(room.roomName),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 10,
        );
      },
    );
  }
}
