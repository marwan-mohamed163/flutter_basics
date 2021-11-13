import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsCatogriesImages extends StatelessWidget{
  String imagePath;
  String title;
  NewsCatogriesImages(this.imagePath,this.title);
  @override
  Widget build(BuildContext context) {
   return 
     Stack(
        alignment:AlignmentDirectional.bottomEnd,
        children: [
          Image.asset(imagePath,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,),
          Text(title,style: TextStyle(
            color:Colors.white,
            backgroundColor:Color.fromARGB(190, 74,19, 109),
          ),
          )
        ],
    );

  }
}