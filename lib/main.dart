import 'package:flutter/material.dart';
import 'package:student_details/Tabs/examtab.dart';
import 'package:student_details/Tabs/homeworktab.dart';
import 'package:student_details/Tabs/quiztab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  static const TextStyle appbartextstyle = TextStyle(fontSize: 35,fontWeight: FontWeight.bold);
  static const TextStyle tabbartextstyle = TextStyle(fontSize: 18,fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(

          backgroundColor: Theme.of(context).colorScheme.inversePrimary,

          title: const Center(child: Text('Student Details',style: appbartextstyle,)),
          bottom: const TabBar(
            tabs: [
              Padding(
                padding: EdgeInsets.fromLTRB(0,5,0,10),
                child: Center(child: Text('Exam',style: tabbartextstyle,)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0,5,0,10),
                child: Center(child: Text('Homework',style: tabbartextstyle,)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0,5,0,10),
                child: Center(child: Text('Quiz',style: tabbartextstyle,)),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Examtab(),
            Homeworktab(),
            Quiztab(),
          ],
        ),
         // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
