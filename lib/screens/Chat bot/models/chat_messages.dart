import 'package:flutter/material.dart';

enum ChatSender {
  user,
  assistant,
  system,
}

enum ChatMessageStatus {
  sending,
  sent,
  failed,
}

extension ChatSenderUI on ChatSender {
  String get label {
    switch (this) {
      case ChatSender.user:
        return 'You';
      case ChatSender.assistant:
        return 'Assistant';
      case ChatSender.system:
        return 'System';
    }
  }
}

extension ChatMessageStatusUI on ChatMessageStatus {
  IconData? get icon {
    switch (this) {
      case ChatMessageStatus.sending:
        return Icons.schedule;
      case ChatMessageStatus.sent:
        return Icons.done;
      case ChatMessageStatus.failed:
        return Icons.error_outline;
    }
  }
}

class ChatMessage {
  final String id;
  final String text;
  final ChatSender sender;
  final DateTime createdAt;
  final ChatMessageStatus status;
  final Map<String, dynamic>? metadata;

  const ChatMessage({
    required this.id,
    required this.text,
    required this.sender,
    required this.createdAt,
    this.status = ChatMessageStatus.sent,
    this.metadata,
  });

  bool get isMine => sender == ChatSender.user;
}