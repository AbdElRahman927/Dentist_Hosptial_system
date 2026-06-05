import 'package:dentist_hospital_system/Auth/main_auth/user_role.dart';
import 'package:dentist_hospital_system/screens/Chat%20bot/controller/chat_controller.dart';
import 'package:dentist_hospital_system/screens/Chat%20bot/widgets/chat_empry_state.dart';
import 'package:dentist_hospital_system/screens/Chat%20bot/widgets/chat_typing_indecator.dart';
import 'package:flutter/material.dart';

import '../widgets/chat_bubble.dart';
import '../widgets/chat_header.dart';
import '../widgets/chat_input_bar.dart';
import '../widgets/chat_role_prompts.dart';

class AiChatScreen extends StatefulWidget {
  final UserRole role;
  final String userName;
  final ChatController controller;

  const AiChatScreen({
    super.key,
    required this.role,
    required this.userName,
    required this.controller,
  });

  @override
  State<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends State<AiChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();

  bool _isSending = false;

  @override
  void initState() {
    super.initState();
    widget.controller.seedWelcomeMessage(widget.role.name);
    widget.controller.addListener(_handleControllerUpdate);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleControllerUpdate);
    _textController.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleControllerUpdate() {
    setState(() {});
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  void _scrollToBottom() {
    if (!_scrollController.hasClients) return;
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent + 120,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  Future<void> _sendMessage() async {
    final text = _textController.text.trim();
    if (text.isEmpty || _isSending) return;

    setState(() => _isSending = true);
    widget.controller.addUserMessage(text);
    _textController.clear();
    _focusNode.requestFocus();

    // Plug your API call here.
    // When response arrives, call:
    // widget.controller.addAssistantMessage(apiResponse);

    setState(() => _isSending = false);
  }

  void _sendPrompt(String prompt) {
    _textController.text = prompt;
    _sendMessage();
  }

  @override
  Widget build(BuildContext context) {
    final messages = widget.controller.messages;
    final prompts = chatPromptsForRole(widget.role);

    return Scaffold(
      backgroundColor: const Color(0xffF4F7FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Color(0xff931A23)),
        title: const Text(
          'AI Assistant',
          style: TextStyle(color: Color(0xff931A23)),
        ),
      ),
      body: Column(
        children: [
          ChatHeader(
            role: widget.role,
            title: 'Hospital AI Assistant',
            subtitle: 'Signed in as ${widget.userName}',
          ),

          Container(
            height: 56,
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 8),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: prompts.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                return ActionChip(
                  label: Text(prompts[index]),
                  backgroundColor: Colors.white,
                  labelStyle: const TextStyle(fontSize: 12),
                  side: BorderSide(color: Colors.grey.shade300),
                  onPressed: () => _sendPrompt(prompts[index]),
                );
              },
            ),
          ),

          Expanded(
            child:
                messages.isEmpty
                    ? const ChatEmptyState()
                    : ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
                      itemCount:
                          messages.length +
                          (widget.controller.isTyping ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (widget.controller.isTyping &&
                            index == messages.length) {
                          return const ChatTypingIndicator();
                        }

                        final message = messages[index];
                        return ChatBubble(message: message);
                      },
                    ),
          ),

          ChatInputBar(
            controller: _textController,
            focusNode: _focusNode,
            isSending: _isSending,
            onSend: _sendMessage,
          ),
        ],
      ),
    );
  }
}
