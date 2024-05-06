import 'package:flutter/material.dart';
import 'package:quiz_app/view/addquestionspage.dart';
import 'package:quiz_app/view/answerpage.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('quiz app'),
        ),
        body:
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder:  (context)=>addquietionpage()));
            }, child: Text("add questions"),
               style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                minimumSize: MaterialStateProperty.all(Size(300, 50)),
              ),
            ),
          ),
        
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AnswerPage()));
              },
              child: Text("answer questions"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                minimumSize: MaterialStateProperty.all(Size(300, 50)),
              ),
          ),
         
        ],
      ),
    ));
  }
}