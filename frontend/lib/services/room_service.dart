import 'package:http/http.dart' as http;

class RoomService {
  final String url = 'http://localhost:8080/stomp/createRoom';

  void createRoom(String RoomId) {
    Uri uri = Uri.parse(url);
    http.post(uri, body: RoomId);
  }
}
