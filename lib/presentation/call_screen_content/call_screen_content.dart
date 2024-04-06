import 'package:flutter/material.dart';
import 'widgets/call_screen_widget.dart';

class CallScreenContent extends StatefulWidget {
  const CallScreenContent({super.key});

  @override
  State<CallScreenContent> createState() => _CallScreenContentState();
}

class _CallScreenContentState extends State<CallScreenContent> {
  TextEditingController callIdController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: TextFormField(
                  controller: callIdController,
                  decoration: const InputDecoration(
                    hintText: "please enter call id",
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: TextFormField(
                  controller: userIdController,
                  decoration: const InputDecoration(
                    hintText: "please enter useriD",
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: TextFormField(
                  controller: userNameController,
                  decoration: const InputDecoration(
                    hintText: "please enter usrname",
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CallScreenWidget(
                              callID: callIdController.text,
                              userID: userIdController.text,
                              username: userNameController.text,
                            )));
                  },
                  child: Text("join the call"))
            ],
          ),
        ),
      ),
    );
  }
}
