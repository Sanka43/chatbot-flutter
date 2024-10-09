// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
// import 'package:dialogflow_flutter/dialogflow_flutter.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Chatbot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatBot(),
    );
  }
}

class ChatBot extends StatefulWidget {
  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final List<Map<String, dynamic>> _messages = [];
  final TextEditingController _controller = TextEditingController();

  // void _handleSubmit(String message) {
  //   _controller.clear();
  //   setState(() {
  //     _messages.insert(0, {'data': 1, 'message': message});
  //   });
  //   _getResponse(message);
  // }

  // void _getResponse(String query) async {
  //   AuthGoogle authGoogle =
  //       await AuthGoogle(fileJson: "assets/dialogflow_key.json").build();
  //   Dialogflow dialogflow =
  //       Dialogflow(authGoogle: authGoogle, language: Language.english);
  //   AIResponse response = await dialogflow.detectIntent(query);

  //   setState(() {
  //     _messages.insert(0, {'data': 0, 'message': response.getMessage() ?? ''});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1c1c1c),
      appBar: AppBar(
        backgroundColor: Color(0xff1c1c1c),
        title: Text(
          "BlueChip",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Add padding around ListView
              child: ListView.builder(
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return _buildMessageItem(
                      _messages[index]['message'], _messages[index]['data']);
                },
              ),
            ),
          ),
          Divider(height: 1.0),
          _buildTextComposer(),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Add padding around TextField
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _controller,
              // onSubmitted: _handleSubmit,
              style: TextStyle(
                color: Colors.white,
              ),
              maxLines: null, // Allow the TextField to grow in height

              decoration: InputDecoration(
                hintText: "Send a message",
                hintStyle: TextStyle(color: Colors.white),
                filled: true, // Optional: Fill the background
                fillColor: const Color.fromARGB(
                    0, 0, 0, 0), // Optional: Background color of the text field
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                  borderSide: BorderSide(
                      color: Colors.white, width: 2.0), // White border
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                      color: Colors.white, width: 2.0), // White border on focus
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0), // White border when enabled
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.send_rounded,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            onPressed: () {
              // _handleSubmit(_controller.text);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMessageItem(String message, int data) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment:
            data == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          data == 1
              ? CircleAvatar(child: Icon(Icons.person))
              : CircleAvatar(child: Icon(Icons.android)),
          SizedBox(width: 10.0),
          Flexible(
            child: Padding(
              padding:
                  const EdgeInsets.all(8.0), // Padding for message container
              child: Container(
                decoration: BoxDecoration(
                  color: data == 1 ? Colors.blueAccent : Colors.grey[300],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(10.0),
                child: Text(
                  message,
                  style:
                      TextStyle(color: data == 1 ? Colors.white : Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
