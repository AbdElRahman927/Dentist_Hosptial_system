import 'dart:collection';

import 'package:dentist_hospital_system/screens/Chat%20bot/models/chat_messages.dart';
import 'package:flutter/foundation.dart';

class ChatController extends ChangeNotifier {
  final List<ChatMessage> _messages = [];
  bool _isTyping = false;

  UnmodifiableListView<ChatMessage> get messages =>
      UnmodifiableListView(_messages);
  bool get isTyping => _isTyping;

  void seedWelcomeMessage(String roleLabel) {
    if (_messages.isNotEmpty) return;

    _messages.add(
      ChatMessage(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        text: 'Hello $roleLabel, how can I help you today?',
        sender: ChatSender.assistant,
        createdAt: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  void setTyping(bool value) {
    _isTyping = value;
    notifyListeners();
  }

  void addUserMessage(String text, {Map<String, dynamic>? metadata}) {
    _messages.add(
      ChatMessage(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        text: text,
        sender: ChatSender.user,
        createdAt: DateTime.now(),
        status: ChatMessageStatus.sent,
        metadata: metadata,
      ),
    );
    notifyListeners();
  }

  void addAssistantMessage(
    String text, {
    ChatMessageStatus status = ChatMessageStatus.sent,
    Map<String, dynamic>? metadata,
  }) {
    _messages.add(
      ChatMessage(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        text: text,
        sender: ChatSender.assistant,
        createdAt: DateTime.now(),
        status: status,
        metadata: metadata,
      ),
    );
    _isTyping = false;
    notifyListeners();
  }

  void addSystemMessage(String text) {
    _messages.add(
      ChatMessage(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        text: text,
        sender: ChatSender.system,
        createdAt: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  void removeLastAssistantPlaceholder() {
    if (_messages.isNotEmpty && _messages.last.sender == ChatSender.assistant) {
      _messages.removeLast();
      notifyListeners();
    }
  }

  void clear() {
    _messages.clear();
    _isTyping = false;
    notifyListeners();
  }
}
