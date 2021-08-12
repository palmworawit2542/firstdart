class Country {
  var country = "UK";
  var city;
  var _animal = "Tiger";   //Private
  static var color = "Black";

  Country(this.city, this._animal);   //Short Constructor

  Country.uk(String city, String animal) : this(city, animal);  //Redirect Constructor

  void callHello() => print("Hi Krub");

  String callAnimal(){
    return this._animal;
  } 

}