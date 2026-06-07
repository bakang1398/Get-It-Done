import 'package:flutter/material.dart';

import '../constants/appColors.dart';
import '../models/to_do.dart';

class TodoItem extends StatelessWidget {
  final ToDo item;
  final Function(String) onDeleteTask;
  final Function(String, bool) onMarkComplete;

  const TodoItem({super.key, required this.item, required this.onDeleteTask, required this.onMarkComplete});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: primaryColorLighter,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              leading: Checkbox(
                value: item.isDone,
                activeColor: primaryColor,
                onChanged: (val) {
                  debugPrint("Checkbox tapped and isDone is $val");
                  onMarkComplete(item.id ?? '', val ?? false);
                },
              ),
              title: Text(
                item.title ?? '',
                style: item.isDone == true ? TextStyle(decoration: TextDecoration.lineThrough, color: primaryColor)
                    : TextStyle(decoration: TextDecoration.none, color: primaryColor)
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              debugPrint("Delete button tapped");
              onDeleteTask(item.id ?? '');
            },
            icon: Icon(Icons.delete, color: secondaryColor,),
          )
        ],
      ),
    );
  }
}
