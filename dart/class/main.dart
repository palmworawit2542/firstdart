import 'city.dart';

void main(){
  print("Hello World");

  // Country item = new Country.uk("London", "Lion");

  // print("Welcome to " + item.country);
  // item.callHello();
  // print("City : " + item.city);   //Show Short Constructor

  // print("Animal : " + item.callAnimal());   //Private Show
  // print("Color : " + Country.color);   //Static Show
  
  var order = City();

  print("Welcome to " + order.country);
  order.callSuper();      //Show Method SuperClass

  print(order.callAnimal());  //Show Override Method
  order.callProblem(); //Show Mixinx
}