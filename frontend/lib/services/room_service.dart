import 'dart:convert';

import 'package:frontend/models/room_data.dart';
import 'package:http/http.dart';

class RoomService {
  static const String url = 'http://localhost:8080/stomp/room';

  static void createRoom(String roomName) {
    Uri uri = Uri.parse(url);
    post(uri, body: jsonEncode(roomName));
  }

  static Future<List<Room>> getRooms() async {
    Response res = await get(
      Uri.parse(url),
    );
    List<Room> createRoom = [];
    print(res.statusCode);
    if (res.statusCode == 200) {
      List<dynamic> rooms = jsonDecode(res.body);

      for (var room in rooms) {
        createRoom.add(Room.fromJson(room));
      }
      return createRoom;
    }

    throw Error();
  }
}
