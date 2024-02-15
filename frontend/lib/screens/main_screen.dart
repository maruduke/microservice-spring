import 'package:flutter/material.dart';
import 'package:frontend/screens/create_room_screen.dart';

// 대화 room 보여주기
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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
                  );
                },
                child: const Text('New Chat Room'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
