import 'package:flutter/material.dart';
import 'package:my_app/widget/NewsCatagoriesImages.dart';

class ListViewExampleScreen extends StatelessWidget{
  List<Category>  items= [
    Category('cars', 'assets/images/cars.jpg'),
    Category('health', 'assets/images/health.png'),
    Category('cars', 'assets/images/cars.jpg'),
    Category('health', 'assets/images/health.png'),
    Category('cars', 'assets/images/cars.jpg'),
    Category('health', 'assets/images/health.png'),
    Category('cars', 'assets/images/cars.jpg'),
    Category('health', 'assets/images/health.png'),
    Category('cars', 'assets/images/cars.jpg'),
    Category('health', 'assets/images/health.png'),
    Category('cars', 'assets/images/cars.jpg'),
    Category('health', 'assets/images/health.png'),
    Category('cars', 'assets/images/cars.jpg'),
    Category('health', 'assets/images/health.png'),
    Category('cars', 'assets/images/cars.jpg'),
    Category('health', 'assets/images/health.png'),
    Category('cars', 'assets/images/cars.jpg'),
    Category('health', 'assets/images/health.png'),
    Category('cars', 'assets/images/cars.jpg'),
    Category('health', 'assets/images/health.png'),
  ];
  @override
  Widget build(BuildContext context) {
// /*   return ListView.builder(itemBuilder:(BuildContext buildContxt,int index) {
//      return NewsCatogriesImages(items[index].imagePath, items[index].name);
//     },
//     itemCount: items.length,
//     );*/
  return GridView.count(crossAxisCount: 2,
  crossAxisSpacing: 4,
  mainAxisSpacing: 4,
  childAspectRatio:3/2 ,
  children: List.generate(items.length, (index) =>
  NewsCatogriesImages(items[index].imagePath,items[index].name)
  ),
  );
  }


}

class Category{
  String name;
  String imagePath;
  Category(this.name,this.imagePath);
}