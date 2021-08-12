import 'country.dart';
import 'problem.dart';

class City extends Country with Problem{     //Class Super, Class Sub, Mix
  
  City() : super("London", "Lion");

  void callSuper(){

    print("City : " + super.city);  //Get Properties
    super.callHello();              //Get Method
  }

  @override       //Create Override Method
  String callAnimal(){
    return "Lion";
  }
}