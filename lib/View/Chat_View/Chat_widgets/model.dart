class Message {
  final String senderId;
  final String senderName;
  final String senderSubtitle;
  final String senderAvatarUrl;
  final String messageContent;
  final String timestamp;

  Message({
    required this.senderId,
    required this.senderName,
    required this.senderSubtitle,
    required this.senderAvatarUrl,
    required this.messageContent,
    required this.timestamp,
  });
}