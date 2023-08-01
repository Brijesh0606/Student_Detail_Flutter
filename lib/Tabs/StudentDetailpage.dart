import 'package:flutter/material.dart';
import 'package:student_details/Students.dart';

class StudentDetailpage extends StatelessWidget {
  final Students s;

  const StudentDetailpage({super.key,required this.s});

  static const TextStyle boldstyle = TextStyle(fontSize: 20,fontWeight: FontWeight.bold);
  static const TextStyle datastyle = TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {

    int? id = s.id;
    String? name = s.name;
    double? examscore = s.scores[0].score;
    double? homeworkscore = s.scores[2].score;
    double? quizscore = s.scores[1].score;
    String path = 'assets/Student_Images/s$id.png';


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(s.name as String),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(
                  path,
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 25,),
                Text('$id',style: boldstyle,),
                SizedBox(height: 25,),
                Text(name!,style: boldstyle,),
                SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Exam",style: boldstyle,),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Homework",style: boldstyle,),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Quiz",style: boldstyle,),
                        ),
                      ]
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('$examscore',style: datastyle,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('$homeworkscore',style: datastyle,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('$quizscore',style: datastyle,),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 50,),

              ],
            ),
          ],
        ),
      ),
    );
  }
}



