import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:to_do_app/main.dart';
import 'package:to_do_app/ui/home/addTodo/AddTodoBottomSheet.dart';
import 'package:to_do_app/ui/home/settings/SettingsFragment.dart';

import 'home/list/ListFragment.dart';

class HomeScreen extends StatefulWidget{
  static final String ROUTE_NAME ='home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          openAddTodo();
        },
        child: Icon(Icons.add,color: MyThemeData.whiteColor,),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          clipBehavior: Clip.antiAlias,
          child:BottomNavigationBar(
            showSelectedLabels:false ,
            showUnselectedLabels: false,
            onTap: onBottomNavigationItem,
            currentIndex: selectedIndex,
            items:<BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/image/icon_list.png')),
                  label: 'TodoList'),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/image/icon_settings.png')),
                  label: 'Settings')
            ],
          )),
      appBar:AppBar(title: Text('ToDo Home'),
        toolbarHeight: 90,
      ),
      body:mainViewItem()
    );
  }
  void openAddTodo(){
    showModalBottomSheet(context: context, builder:(builder){
      return AddTodoBottomSheet();
    },
    isScrollControlled: true,

    );


  }

   mainViewItem(){
    if(selectedIndex==0)
      return ListFragment();
  else if(selectedIndex==1)
    return  SettingsFragment();
}

  void onBottomNavigationItem(int pos){
    setState(() {
      selectedIndex=pos;
    });
  }
}