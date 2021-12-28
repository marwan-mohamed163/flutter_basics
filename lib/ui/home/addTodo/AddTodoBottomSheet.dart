import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/ui/home/dataBase/model/Todo.dart';
class AddTodoBottomSheet extends StatefulWidget{
  @override
  State<AddTodoBottomSheet> createState() => _AddTodoBottomSheetState();
}

class _AddTodoBottomSheetState extends State<AddTodoBottomSheet> {
  String title='';
  String content='';
  DateTime date=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Add Todo',),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Title'),
          onChanged: (newText){
            title=newText;
          },
        ),
        TextField(
          minLines: 4,
          maxLines: 4,
          decoration: InputDecoration(labelText: 'content'),
          onChanged: (newText){
            content=newText;
          },
        ),
        InkWell(
          onTap:(){
            choosenDateForTodo();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:date==null?
            Text('Select date',textAlign:TextAlign.start,):
            Text('${date.year} / ${date.month} / ${date.day}'),
          ),
        ),
        ElevatedButton(onPressed:(){
          addTodoItem();
        },
            child:Text('Add Todo'))
      ],
      ),
    );
  }
  void addTodoItem()async{
    Todo todo =Todo(title: title, content: content, dateTime: date);
    var box =await Hive.openBox<Todo>(Todo.BOX_NAME);
    box.add(todo);
    //to dismiss this widget page
    Navigator.pop(context);
  }
  void choosenDateForTodo()async{
    var choosedate = await showDatePicker(
         initialDate:DateTime.now(),
         firstDate: DateTime.now(),
         lastDate: DateTime.now().add(const Duration(days: 365)), context:context);
         date = choosedate! ;
  }
}