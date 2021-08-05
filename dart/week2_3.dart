void main(){
  //print(callGen(1999));
  //print(callColor());

  // var x = callColor("white");
  // print(x);

  callWeb("google", protocal : "https", port : 443);
}

String callGen(int year) => (year >= 1996) ? "Gen Z" : "Gen Y" ;

int callColor([String newColor = "N/A"]){
  List<dynamic> color = ["red", "black", "pink"];

  color.add(newColor);

  for(var item in color){
    print(item);
  }

  return color.length;
}

void callWeb(String web, {int port = 80, String protocal = "http"}) => print("$protocal : $web : $port");
