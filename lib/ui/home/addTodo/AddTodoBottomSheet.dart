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
  DateTime? date=null;
  bool titleError=false,contentError=false,dateError=false;
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
          decoration: InputDecoration(
              errorText:titleError?'Please enter a title':null,
              labelText: 'Title'),
          onChanged: (newText){
            title=newText;
            if(newText.isNotEmpty){
              setState(() {
                titleError=false;
              });
            }
          },
        ),
        TextField(
          minLines: 4,
          maxLines: 4,
          decoration: InputDecoration(
              errorText:contentError?'Please enter content':null,
              labelText: 'content'),
          onChanged: (newText){
            content=newText;
            if(newText.isNotEmpty){
              setState(() {
                contentError=false;
              });
            }
          },
        ),
        InkWell(
          onTap:(){
            choosenDateForTodo();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: date==null?
                   Text(dateError?'No date selected':'Select date',
                     style:TextStyle(color: dateError?Colors.red:Colors.black),
                   ):
                   Text('selectd date :${date!.year}-${date!.month}-${date!.day}',
                   ),
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
    if(!valid()) return;
    Todo todo =Todo(title: title, content: content, dateTime: date!);
    var box =await Hive.openBox<Todo>(Todo.BOX_NAME);
    box.add(todo);
    //to dismiss this widget page
    Navigator.pop(context);
  }
  bool valid(){
   bool valid=true;
   if(title.isEmpty){
     setState(() {
       titleError=true;
     });
   }
   if(content.isEmpty){
     setState(() {
       contentError=true;
     });
   }
   if(date==null){
     setState(() {
       dateError=true;
     });
   }
   return valid;
  }
  void choosenDateForTodo()async{
    var choosedate = await showDatePicker(
         initialDate:DateTime.now(),
         firstDate: DateTime.now(),
         lastDate: DateTime.now().add(const Duration(days: 365)), context:context);
    this.setState(() {
      date = choosedate ;
    });
  }
}