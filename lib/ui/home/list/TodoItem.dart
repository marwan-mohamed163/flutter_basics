import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_app/main.dart';
import 'package:to_do_app/ui/home/dataBase/model/Todo.dart';

class TodoItem extends StatelessWidget{
  Todo todo;
  Function onDeleteAction,onCheckItem,onItemPressed;

  TodoItem(this.todo,this.onDeleteAction,this.onCheckItem,this.onItemPressed);
  @override
  Widget build(BuildContext context) {
    return
        InkWell(
          onTap: (){
            onItemPressed(todo,context);
          },
          child: Container(
            child: Slidable(
                closeOnScroll: true,
                actionExtentRatio: 0.3,
                child:Container(
                  decoration: BoxDecoration(
                      color: MyThemeData.whiteColor,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  margin: EdgeInsets.only(top: 4,bottom: 4,right: 12),
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color:todo.isDone?Colors.green:MyThemeData.primaryColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        width: 5,
                        height: 80,
                      ),
                      Expanded(child:
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.start,
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.all(8),
                            child: Text(todo.title,
                              style: TextStyle(fontWeight:FontWeight.bold,
                            fontSize: 18,color:todo.isDone?Colors.green: MyThemeData.primaryColor),
                            ),
                            ),
                          Row(children:[
                            Icon(Icons.calendar_today_outlined),
                            Text(todo.dateTime.toString(),textAlign: TextAlign.center,)
                          ],
                          ),

                          ],
                        ),
                      ),),
                      InkWell(
                        onTap:(){
                          onCheckItem(todo);
                        },
                        child:
                        todo.isDone?
                        Container(
                          margin: EdgeInsets.all(14),
                          padding: EdgeInsets.symmetric(vertical:8,horizontal: 16 ),
                          child: Text('Done !',style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold
                          ,color: Colors.green),
                          ),
                        )
                        :Container(
                          margin: EdgeInsets.all(14),
                          padding: EdgeInsets.symmetric(vertical:8,horizontal: 16 ),
                          decoration: BoxDecoration(
                            color: MyThemeData.primaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image(image: AssetImage('assets/image/Icon-check.png'),),
                        ),
                      ),

                    ],
                  ),
                ),
              actionPane:SlidableScrollActionPane(),
              actions: [
                IconSlideAction(
                  onTap: (){
                    onDeleteAction(todo);
                  },
                  color: Colors.transparent,
                  iconWidget: Container(
                    margin: EdgeInsets.all(12),
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color:Colors.red,
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(12),bottomLeft:Radius.circular(12),)
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.delete,color: Colors.white,),
                          Text('Delete',style:TextStyle(color: Colors.white),)
                        ],
                      ),
                    ),
                  ),
                )
              ],

            ),
          ),
        );
  }
}