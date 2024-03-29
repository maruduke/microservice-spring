class Room {
  late final int roomId;
  late final String roomName;

  Room.fromJson(Map<String, dynamic> json) {
    roomId = json['roomId'];
    roomName = json['roomName'];
  }
}
