import 'package:flutter/material.dart';

void main() => runApp(const BallPage());

class BallPage extends StatelessWidget {
  const BallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Swipe to Dismiss'),
          centerTitle: true,
        ),
        body: const Focus(),
      ),
    );
  }
}

class Focus extends StatefulWidget {
  const Focus({Key? key}) : super(key: key);

  @override
  State<Focus> createState() => _FocusState();
}

class _FocusState extends State<Focus> {
  late FocusNode specialFocusNode;
  @override
  void initState() {
    //create the FocusNode as soon as the page is created
    super.initState();
    specialFocusNode = FocusNode();
  }

  @override
  void dispose() {
    //destroys the FocusNode as soon as the page is destroyed
    //because it is a long-lived object
    specialFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Field Focus'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const TextField(
              //automatically setting the focus as soon as the page comes into view
              autofocus: true,
            ),
            TextField(
              //TextField with a FocusNode
              focusNode: specialFocusNode,
            ),
            ElevatedButton(
              //giving focus to the TextField with the specified FocusNode
              onPressed: () => specialFocusNode.requestFocus(),
              child: const Text('Focus'),
            ),
          ],
        ),
      ),
    );
  }
}
