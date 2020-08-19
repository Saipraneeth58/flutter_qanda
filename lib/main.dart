import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'questions.dart';
questions ques =questions();
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  final descController = TextEditingController();
  String description;
  String newone='';
  void dispose() {
    descController.dispose();
    super.dispose();
  }
  void nextquestion(){
    setState(() {


      if(ques.isfinished()==true)
      {
        print('done');
        ques.reset();
      }
      else {
        ques.nextQuestion();

      }
    });

  }
  _write(String complaintTitle, String description) async {
    String text;
    final Directory directory = await getApplicationDocumentsDirectory();
    File textFile = File('${directory.path}/' +
        'myfile.txt');
    await textFile.writeAsString('ComplaintTitle:\n' +
        complaintTitle +
        '\nDescription:\n' +
        description);
    text = await textFile.readAsString();
    newone=newone+text;
    print(newone);
//    print(textFile.path);
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children:[
           Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  ques.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
            Expanded(
              child: TextField(
                controller: descController,
                keyboardType: TextInputType.multiline,
                maxLines: 8,
                decoration: InputDecoration(
                  hintText: 'Description',
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: FlatButton(
                          textColor: Colors.white,
                          color: Colors.blueAccent,
                          child: Text(
                            'Answer',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: () {
                            //The user picked true.
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: FlatButton(
                          textColor: Colors.white,
                          color: Colors.pink,
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: () {
                            descController.clear();
                            nextquestion();
                            //The user picked true.
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: FlatButton(
                          textColor: Colors.white,
                          color: Colors.black,
                          child: Text(
                            'Pause',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: () {
                            //The user picked true.
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: FlatButton(
                          textColor: Colors.white,
                          color: Colors.green,
                          child: Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: () {
                            description=descController.text;
                            print(description);
                            _write(ques.getQuestionText().toString(), description);
                            descController.clear();
                            nextquestion();
                            //The user picked true.
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
        ],
        ),


      ),


    );
  }
}
