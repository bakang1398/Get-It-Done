import 'package:flutter/material.dart';
import 'package:my_todo/constants/appColors.dart';

import '../helpers/ui_helpers.dart';
import '../models/to_do.dart';
import '../widgets/todo_item.dart';

class TodoHomeView extends StatefulWidget {
  final List<ToDo> tasks;
  const TodoHomeView({super.key, required this.tasks});

  @override
  State<TodoHomeView> createState() => _TodoHomeViewState();
}

class _TodoHomeViewState extends State<TodoHomeView> {
  List<ToDo> addedTasks = [];
  final TextEditingController _taskController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    addedTasks = widget.tasks;
    super.initState();
  }

  void _addOneTask(String taskText) {
    setState(() {
      addedTasks.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: taskText,
        isDone: false
      ));
    });
  }

  void _removeATask(String taskId) {
    setState(() {
      addedTasks.removeWhere((element) => element.id == taskId);
    });
  }

  void _markComplete(String taskId, bool isDone) {
    debugPrint("Mark complete tapped and isDone is $isDone");
    setState(() {
      addedTasks.firstWhere((element) => element.id == taskId).isDone = isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Get It Done'),
        centerTitle: true,
        foregroundColor: whiteColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  itemCount: addedTasks.length,
                    shrinkWrap: true,
                    itemBuilder: (buildContext, index) {
                    final task = addedTasks[index];
                      return Column(
                        children: [
                          TodoItem(
                            item: task,
                            onDeleteTask: _removeATask,
                            onMarkComplete: (taskId, val) {
                              _markComplete(taskId, val);
                            },
                          ),
                          SizedBox(
                            height: 15,
                          )
                        ],
                      );
                })
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _taskController,
                      decoration: InputDecoration(
                        hintText: 'Add a new task',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      if(_taskController.text.isNotEmpty) {
                        _addOneTask(_taskController.text);
                        _taskController.clear();
                      }
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: primaryColorLighter,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.add,
                        size: 20,
                        color: primaryColorLightest,
                      ),
                    ),
                  )
                ]
              )
            ),
          ],
        ),
      ),
    );
  }
}
