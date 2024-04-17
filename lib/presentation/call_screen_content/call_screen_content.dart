import 'package:flutter/material.dart';
import 'package:stream_it_1_0/widgets/custom_button.dart';
import 'package:stream_it_1_0/widgets/custom_text_form_field.dart';
import 'widgets/call_screen_widget.dart';
import 'package:stream_it_1_0/core/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stream_it_1_0/widgets/custom_button.dart';

class CallScreenContent extends StatefulWidget {
  const CallScreenContent({Key? key}) : super(key: key);

  @override
  State<CallScreenContent> createState() => _CallScreenContentState();
}

class _CallScreenContentState extends State<CallScreenContent> {
  TextEditingController callIdController = TextEditingController();
  String userName = Constants.getFacebookName().toString();
  String? userId;

  @override
  void initState() {
    super.initState();
    // Fetch user ID from Firebase
    userId = FirebaseAuth.instance.currentUser?.uid.substring(20, 26);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                userName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: CustomTextFormField(
                  controller: callIdController,
                    hintText: 'Enter Call ID',
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CallScreenWidget(
                        callID: callIdController.text,
                        userID: userId!,
                        username: userName,
                      ),
                    ),
                  );
                },
                text: "Join Call",
                shape: ButtonShape.RoundedBorder6,
                padding: ButtonPadding.PaddingAll8,
                variant: ButtonVariant.FillBlueA700,
                fontStyle: ButtonFontStyle.GilroyMedium16,
                width: MediaQuery.of(context).size.width * 0.6,
              )
            ],
          ),
        ),
      ),
    );
  }
}
