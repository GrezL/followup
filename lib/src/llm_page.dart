import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'llm/logic.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final logger = Logger();
  final logic = Get.put(ChatLogic());
  final state = Get.find<ChatLogic>().state;

  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;

void onListen() async {
    bool available = await _speech.initialize(
        onStatus: (val) => logger.d('onStatus: $val'),
        onError: (val) => logger.d('onError: $val'));

    if (!_isListening) {
      if (available) {
        setState(() {
          _isListening = false;
          _speech.listen(
            onResult: (val) => setState(() {
            }),
          );
        });
      }
    } else {
      setState(() {
        _isListening = false;
        _speech.stop();
      });
    }
  }

  void stopListen() {
    _speech.stop();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Chat'),
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: const Icon(Icons.camera_alt), tooltip: 'Upload diagnosis',),
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications), tooltip: 'Notification',),
        ],
      ),
      body: GetBuilder<ChatLogic>(
        builder: (context) => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.messages.length,
                itemBuilder: (BuildContext context, int index) {
                  Map m = state.messages[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: m['sender'] == 'user'
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: m['sender'] == 'user'
                                  ? Colors.green[100]
                                  : Colors.white,
                            ),
                            child: Text(m['text']),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.mic),
                    onPressed: (){}
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                          decoration: const InputDecoration(
                            hintText: 'Please enter your question',
                            border: InputBorder.none,
                          ),
                          controller:
                              TextEditingController(text: state.message),
                          onChanged: (value) {
                            state.message = value;
                          },),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: state.isRequesting
                        ? null
                        : () {
                            logic.sendMessage(state.message);
                          },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}