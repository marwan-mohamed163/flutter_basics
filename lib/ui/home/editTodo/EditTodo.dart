import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/main.dart';
import 'package:to_do_app/ui/home/dataBase/model/Todo.dart';

class EditTodo extends StatefulWidget{
  static final String ROUTE_NAME = 'edit_task';

  @override
  State<EditTodo> createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {
  late Todo todo;
  String title='';
  String content='';
  DateTime? date = null;
  bool titleError = false,contentError=false,dateError=false;
  int buildTimeCounter=0;
  @override
  Widget build(BuildContext context) {
    if(buildTimeCounter==0) {
       todo = ModalRoute.of(context)!.settings.arguments as Todo;
      title=todo.title;
      content=todo.content;
      date=todo.dateTime;
      buildTimeCounter++;
    }
    return Scaffold(

      body: Stack(
        children: [
          Container(color: MyThemeData.accentColor,),
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(bottom: 120),
              color: MyThemeData.primaryColor,
              child: AppBar(
                backgroundColor: MyThemeData.primaryColor,
                elevation: 0,
                title: Text('Todo editor'),
              ),
            ),
          ),
          Positioned(
            left: 40,
            top: 100,
            right: 40,
            bottom: 100,
            child: Container(
              decoration: BoxDecoration(
                color: MyThemeData.whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(25)),),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Edit Task',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:MyThemeData.blackColor),),
                  ),
                  SizedBox(height: 16,),
                  TextFormField(
                    initialValue: todo.title,
                    decoration: InputDecoration(
                      labelText: 'Title',
                      errorText:titleError?'Please enter a title':null,
                      contentPadding: EdgeInsets.all(8)
                    ),
                    onChanged:(newText){
                      title=newText;
                      if(title.isNotEmpty) {
                        setState(() {
                          titleError = false;
                        });
                      }
                      todo.title=newText;
                    },
                  ),
                  TextFormField(
                    initialValue: todo.content,
                    maxLines: 4,
                    minLines: 4,
                    decoration: InputDecoration(
                      labelText: 'content',
                      errorText: contentError?'Please enter content':null,
                      contentPadding: EdgeInsets.all(8)
                    ),
                    onChanged: (newText){
                      content=newText;
                      if(content.isNotEmpty) {
                        setState(() {
                          contentError = false;
                        });
                      }
                      todo.content=newText;
                    },
                  ),

                 InkWell(
                   onTap: (){
                     choosenDateForTodo();
                   },
                   child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:date==null?
                      Text( dateError?'no date changed':'change date',textAlign: TextAlign.start,
                        style:TextStyle(fontSize:20,fontWeight:FontWeight.bold,
                            color:dateError?Colors.red:Colors.black )):
                          Text('${date!.day}-${date!.month}-${date!.year}',
                          style: TextStyle(fontSize: 18),)
                    ),
                 ),

                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(left: 25,right:25,bottom: 35),
                    child: ElevatedButton(onPressed:() {
                      onSaveChange(context);
                    },
                        child: Text('Save changes',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                    ,style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.only(left: 16,right: 16)),
                        backgroundColor: MaterialStateProperty.all(MyThemeData.primaryColor),
                        shape:MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius:BorderRadius.circular(22)
                        ))

                      ),
                    ),
                  )
                ],
              ),
              ),
            ),
        ],
      ),
    );
  }

  void onSaveChange(BuildContext context)async{
    if(!valid())return;
    var box =await Hive.openBox<Todo>(Todo.BOX_NAME);
    List<Todo> list= box.values.toList();
    int index=0;
    for(int i=0;i<list.length;i++){
      if(todo.title==list[i].title){
        index=i;
      }
    }
    box.putAt(index,new Todo(title: title, content: content, dateTime: date!));
    Navigator.of(context).pop();
  }
  bool valid(){
    bool valid =true;
    if(title.isEmpty) {
      setState(() {
        titleError = true;
        valid = false;
      });
    }
    if(content.isEmpty) {
      setState(() {
        contentError = true;
        valid = false;
      });
    }
    if(date==null){
      setState(() {
        dateError=true;
        valid=false;
      });
    }
    return valid;
  }
  void choosenDateForTodo()async{
    var chooseDate = await showDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)),context: context);
    date=chooseDate;
    setState(() {
      if(dateError!=null){
        dateError=false;
      }
    });
  }
}