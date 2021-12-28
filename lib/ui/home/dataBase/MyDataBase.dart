
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/ui/home/dataBase/model/Todo.dart';
void initDataBase()async{
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
}