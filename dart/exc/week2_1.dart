void main(){
  print(callGen(1999));
  
}

String callGen(int year) =>

  // var year = 2000;

  // if(year >= 1996){
  //   print("Gen Z");
  // }else{
  //   print("Gen Y");
  // }

// การเช็คเงื่อนไข แบบ Short
    //เงื่อนไข       TRUE             FALSE           
(year >= 1996) ? "Gen Z" : "Gen Y" ;

//return x;

