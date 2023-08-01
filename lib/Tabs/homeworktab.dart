import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:student_details/StudentDetailpage.dart';
import 'package:student_details/Students.dart';


class Homeworktab extends StatefulWidget{
  @override
  State<Homeworktab> createState() => _HomeworktabState();
}

class _HomeworktabState extends State<Homeworktab> {

  static const TextStyle homedatastyle = TextStyle(fontSize: 20,);

  Future<List<Students>> getdata() async {
    String data = await DefaultAssetBundle.of(context).loadString('assets/students.json');
    List mapdata = jsonDecode(data);

    List<Students> home = [];

    List<Students> students = mapdata.map((student) => Students.fromJson(student)).toList();

    for(int i=0;i<students.length;i++){
      if(students[i].scores[2].score >= 35.0) {
        home.add(students[i]);
      }
    }
    return home;
  }

  @override
  void initState() {

    super.initState();

    getdata();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FutureBuilder<List<Students>>(
        future: getdata(),
        builder: (context,data){
          if(data.hasData){
            List<Students> students = data.data!;
            return ListView.builder(
                itemCount: students.length,
                itemBuilder: (context,index){
                  return Center(
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> StudentDetailpage(s: students[index],)));
                                },
                                child: Text(students[index].name!,style: homedatastyle,),
                              ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          }
          else{
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}