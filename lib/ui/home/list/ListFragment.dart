import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:to_do_app/main.dart';
import 'package:to_do_app/ui/home/dataBase/model/Todo.dart';
import 'package:to_do_app/ui/home/editTodo/EditTodo.dart';
import 'package:to_do_app/ui/home/list/TodoItem.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ListFragment extends StatefulWidget {
  @override
  State<ListFragment> createState() => _ListFragmentState();
}

class _ListFragmentState extends State<ListFragment> {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  List<Todo> todosList = [];
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('TodoListScreen'),
      onVisibilityChanged: (VisibilityInfo info) {
        getTodoFormBox();
      },
      child: Container(
        color: MyThemeData.accentColor,
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.now().subtract(Duration(days: 30)),
              lastDay: DateTime.now().add(Duration(days: 30)),
              focusedDay: focusedDay,
              headerVisible: false,
              calendarFormat: CalendarFormat.week,
              calendarStyle: CalendarStyle(
                  selectedTextStyle:
                      TextStyle(fontSize: 18, color: MyThemeData.whiteColor),
                  selectedDecoration: BoxDecoration(
                    color: MyThemeData.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  defaultDecoration: BoxDecoration(
                    color: MyThemeData.whiteColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  defaultTextStyle: TextStyle(
                    fontSize: 16,
                    color: MyThemeData.blackColor,
                  ),
                isTodayHighlighted: false
              ),
              selectedDayPredicate: (day) {
                return isSameDay(day, selectedDay);
              },
              onDaySelected: (newSelectedDate, newFocusedDay) {
                setState(() {
                  selectedDay = newSelectedDate;
                  focusedDay = newFocusedDay;
                });
                getTodoFormBox();
              },
              weekendDays: [],
            ),
            Expanded(
                child:todosList.length >0 ?
                ListView.builder(   itemCount: todosList.length,
                itemBuilder: (context, index) {
                return TodoItem(todosList[index],onDeleteItem,onCheckItem,onItemPressed);
              }):
                    Center(
                      child: Text('No todos for this day'),
                    )
            ,)
          ],
        ),
      ),
    );
  }

  void onDeleteItem(Todo item)async{
    print(item.title);
    var box =await Hive.openBox<Todo>(Todo.BOX_NAME);
    int index = box.values.toList().indexOf(item);
    box.deleteAt(index);
    getTodoFormBox();
  }

  void onCheckItem(Todo item)async{
    print('item before change its sate ${item.isDone}');
    var box = await Hive.openBox<Todo>(Todo.BOX_NAME);
    int index = box.values.toList().indexOf(item);
    item.isDone = item.isDone?false:true;
    box.putAt(index, item);
    print(box.values.toList().elementAt(index).isDone);
    getTodoFormBox();
  }

  void onItemPressed(Todo item,BuildContext context)async{
    var box = await Hive.openBox<Todo>(Todo.BOX_NAME);
    box.close();
    Navigator.of(context).pushNamed(EditTodo.ROUTE_NAME,arguments:item);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTodoFormBox();
  }

  void getTodoFormBox() async {
    var box = await Hive.openBox<Todo>(Todo.BOX_NAME);
    setState(() {
      todosList = box.values
          .where((item) => isSameDay(item.dateTime, selectedDay))
          .toList();
    });
  }
}
