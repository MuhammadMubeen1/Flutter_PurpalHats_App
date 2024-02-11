// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:property_managment/components/app_bar.dart';
import 'package:property_managment/components/color.dart';
import 'package:property_managment/components/global.dart';
import 'package:property_managment/module/Worker/task_detail_screen.dart';
import 'package:get/get.dart';

import '../../API/task_list_api.dart';
import '../../models/agent_model/check_in_model.dart';
import '../../models/agent_model/check_in_model.dart';
import '../../models/agent_model/services/tasklist.dart';
import '../../models/task_list_model.dart';

class MyTask extends StatefulWidget {
  const MyTask({
    Key? key,
  }) : super(key: key);

  // final String  title, description;
  @override
  State<MyTask> createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {
  final Taskservices ts = Taskservices();
// TaskAPI task=TaskAPI();
  List<Task>? tasks = [];
  void initState() {
    super.initState();
    getalltask();

    ts.gettask(context, '144');
    // Tasklist.getaltask();
//  task.taskPost('144');
  }

  void getalltask() async {
    var task = await ts.gettask(context, '144');
    setState(() {
      tasks = task;
    });
  }

// TaskModel post;

//  Future<void> getNewsList() async {
//      post= await task.taskPost('144');
//     setState(() {});
//   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildNavigationBar(context, "My Task"),
        backgroundColor: WHITE_COLOR,
        body: _itemBuilder(context));
  }

  Widget _itemBuilder(context) {
    return FutureBuilder<List<Task>>(
      future: ts.gettask(context, '144'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: tasks!.length,
              itemBuilder: (BuildContext context, int index) {
                return 
                Container(
                  height: Get.height,
                  width: Get.width,
                 // color: Colors.grey,
                  child: SafeArea(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TaskDetailScreen()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10, top: 20, right: 10),
                        // height: Get.height/6.2,
                        // width: Get.width*0.97,
                        child: Column(
                          children: [
                            Card(
                              color: Color(0xffE8E6EA),
                              child: Column(children: [
                                // SizedBox(height:30),
                                Container(
                                  height: Get.height / 17,
                                  margin: EdgeInsets.only(right: 10, left: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(tasks![index].name!,
                                          style: headingTextStyle(
                                              context, BLACK_COLOR)),
                                      //Text("Accepted", style:hintTextStyle(context, GREEN_COLOR_BASIC)),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10, left: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(tasks![index].startedDate.toString(),
                                          style: highltedTextStyle(context)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 10, left: 10, bottom: 10),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Client no. ",
                                          style: headingTextStyle(
                                              context, GREY_COLOR_)),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(tasks![index].agentId.toString(),
                                          style: headingTextStyle(
                                              context, GREY_COLOR_)),
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                            SizedBox(height: 20),
                            Card(
                              color: Color(0xffE8E6EA),
                              child: Column(children: [
                                Container(
                                  height: Get.height / 17,
                                  margin: EdgeInsets.only(right: 10, left: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Toilet Maintenance",
                                          style: headingTextStyle(
                                              context, BLACK_COLOR)),
                                      //Text("Rejected", style:cardTextStyle(context, red)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  margin: EdgeInsets.only(right: 10, left: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(tasks![index].startedDate.toString(),
                                          style: highltedTextStyle(context)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 10, left: 10, bottom: 10),
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Client no. ",
                                          style: headingTextStyle(
                                              context, GREY_COLOR_)),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(tasks![index].agentId.toString(),
                                          style: headingTextStyle(
                                              context, GREY_COLOR_)),
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Card(
                              color: Color(0xffE8E6EA),
                              child: Column(children: [
                                SizedBox(height: 20),
                                Container(
                                  margin: EdgeInsets.only(right: 10, left: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Fix water leak in kitchen",
                                          style: headingTextStyle(
                                              context, BLACK_COLOR)),
                                      // Text("Requested", style:cardTextStyle(context, BROWN)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  margin: EdgeInsets.only(right: 10, left: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(tasks![index].startedDate.toString(),
                                          style: highltedTextStyle(context)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 10, left: 10, bottom: 10),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Client no. ",
                                          style: headingTextStyle(
                                              context, GREY_COLOR_)),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(tasks![index].agentId.toString(),
                                          style: headingTextStyle(
                                              context, GREY_COLOR_)),
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Card(
                              color: Color(0xffE8E6EA),
                              child: Column(children: [
                                SizedBox(height: 20),
                                Container(
                                  margin: EdgeInsets.only(right: 10, left: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Collect Rent from Tenant",
                                          style: headingTextStyle(
                                              context, BLACK_COLOR)),
                                      //  Text("Started", style:cardTextStyle(context, YELLOW)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  margin: EdgeInsets.only(right: 10, left: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(tasks![index].startedDate.toString(),
                                          style: highltedTextStyle(context)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 10, left: 10, bottom: 10),
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Client no. ",
                                          style: headingTextStyle(
                                              context, GREY_COLOR_)),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(tasks![index].agentId.toString(),
                                          style: headingTextStyle(
                                              context, GREY_COLOR_)),
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Card(
                              color: Color(0xffE8E6EA),
                              child: Column(children: [
                                SizedBox(height: 20),
                                Container(
                                  margin: EdgeInsets.only(right: 10, left: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Collect Rent from Tenant",
                                          style: headingTextStyle(
                                              context, BLACK_COLOR)),
                                      //Text("Completed", style:cardTextStyle(context, SKY_BLUE)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  margin: EdgeInsets.only(right: 10, left: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(tasks![index].startedDate.toString(),
                                          style: highltedTextStyle(
                                            context,
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 10, left: 10, bottom: 10),
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Client no. ",
                                          style: headingTextStyle(
                                              context, GREY_COLOR_)),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(tasks![index].agentId.toString(),
                                          style: headingTextStyle(
                                              context, GREY_COLOR_)),
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        // By default show a loading spinner.
        return Center(
            child: const CircularProgressIndicator(
          color: Colors.grey,
          backgroundColor: Colors.blue,
        ));
      },
    );
  }
}
