// ignore_for_file: prefer_const_constructors

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
      backgroundColor: Colors.black26,
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text(
          "Chatbot",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessageItem(
                    _messages[index]['message'], _messages[index]['data']);
              },
            ),
          ),
          Divider(height: 1.0),
          _buildTextComposer(),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return Center /*IconTheme*/ (
      // data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _controller,
                // onSubmitted: _handleSubmit,
                decoration: InputDecoration.collapsed(
                    hintText: "Send a message",
                    hintStyle: TextStyle(
                        color: const Color.fromARGB(255, 202, 202, 202))),
              ),
            ),
            IconButton(
                icon: Icon(
                  Icons.send,
                  color: const Color.fromARGB(255, 202, 202, 202),
                ),
                onPressed: () => () /*_handleSubmit(_controller.text),*/
                ),
          ],
        ),
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
        ],
      ),
    );
  }
}
