import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ChatView extends GetView {
  const ChatView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ChatView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
