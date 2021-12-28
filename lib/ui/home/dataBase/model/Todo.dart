import 'package:hive/hive.dart';
part 'Todo.g.dart';
@HiveType(typeId: 0)
class Todo extends HiveObject {
  static final BOX_NAME ='todos';
  @HiveField(0)
  String title;
  @HiveField(1)
  String content;
  @HiveField(2)
  DateTime dateTime;
  @HiveField(3)
  bool isDone;

  Todo({required this.title,
        required this.content,
        required this.dateTime,
        this.isDone=false});
}
