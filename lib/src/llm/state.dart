class ChatState {

  String message = '';
  String sender = 'user';
  bool isRequesting = false;
  List<Map<String, dynamic>> messages = [];

  void requestStatus(String content) {
    messages.add({'text': content, 'sender': 'user'});
    sender = 'bot';
    messages.add({'text': 'replying...', 'sender': sender});
    isRequesting = true;
    message = '';
  }

  void responseStatus(String content) {
    messages.removeLast(); // 
    messages.add({'text': content, 'sender': sender});
    sender = 'user';
    isRequesting = false;
  }
}