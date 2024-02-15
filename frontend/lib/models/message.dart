class Message {
  late final int roomId;
  late final String senderName;
  late final String message;

  Message(this.roomId, this.message, this.senderName);

  Message.fromJson(Map<String, dynamic> json) {
    roomId = json['roomId'];
    message = json['message'];
    senderName = json['senderName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['roomId'] = roomId;
    data['message'] = message;
    data['senderName'] = senderName;
    return data;
  }
}
