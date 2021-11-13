import 'package:flutter/material.dart';
class MyScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyScreenState();
  }
}
class MyScreenState extends State{
    late String text='';
    List<String> names =[];
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            TextField(onChanged:onChangedTextListener,
            controller: TextEditingController(text: text),)
            ,
            ElevatedButton(onPressed:()=>{
              showCustomDialog(context)
            },
                child:Text('show text')),
            Expanded(
              child: ListView.builder(itemCount: names.length,itemBuilder:(BuildContext ,int index)=>
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(names[index],textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28),),
              )
              ),
            )
          ],
        );

  }
  void showCustomDialog(BuildContext context){
    String textToShow = text;
    setState(() {
      names.add(textToShow);
      text='';
    });
    showDialog(context: context, builder: (BuildContext)=>
      AlertDialog(title: Text('Your Text'),content:Text (textToShow),)
    );
  }
  void onChangedTextListener(String newText){
    text= newText;
}
}