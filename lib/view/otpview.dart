import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/cubit/cubit/choice_cubit.dart';
import 'package:quiz_app/view/answerpage.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String enteredOTP = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('enter exam number'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: PinCodeTextField(
            appContext: context,
            length: 4,
            obscureText: false,
            animationType: AnimationType.fade,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.underline,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 40,
              activeFillColor: Colors.white,
            ),
            onChanged: (value) {
              setState(() {
                enteredOTP = value;
              });
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool value = await BlocProvider.of<ChoiceCubit>(context)
              .checkNumber(enteredOTP);
          if (value) {
          Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => AnswerPage(id: enteredOTP,)),
);
          }
          else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('wrong otp'),));
          }
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
