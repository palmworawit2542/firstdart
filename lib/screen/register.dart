import 'package:firstdart/backend/database.dart';
import 'package:firstdart/config/constant.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({ Key? key }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  var name, surname, email, password, conpwd, confirmpassword;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Register'),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                txtName(),
                txtsurName(),
                txtEmail(),
                txtPassword(),
                txtconfirmPassword(),
                btnSubmit(),
              ],
            ),
          ),
        ),
      ),
    );
    
  }

  Widget txtName(){
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: TextFormField(
        style: TextStyle(
          fontSize: 24.0,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: 'Name:',
          icon: Icon(Icons.account_circle_outlined),
          hintText: 'Input your name',
        ),
        validator: (String? value){
          if(value!.isEmpty){
            return 'กรุณากรอกชื่อ';
          }else if (value.length < 2){
            return "กรุณากรอกข้อมูลมากกว่า 2 ตัวอักษร";
          }
        },
        onSaved: (String? value){
          name = value!.trim();
        },
      ),
    );
  }

  Widget txtsurName(){
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: TextFormField(
        style: TextStyle(
          fontSize: 24.0,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: 'Surname:',
          icon: Icon(Icons.account_circle),
          hintText: 'Input your surname',
        ),
        validator: (String? value){
          if(value!.isEmpty){
            return 'กรุณากรอกนามสกุล';
          }else if (value.length < 2){
            return "กรุณากรอกข้อมูลมากกว่า 2 ตัวอักษร";
          }
        },
        onSaved: (String? value){
          surname = value!.trim();
        },
      ),
    );
  }

  Widget txtEmail(){
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          fontSize: 24.0,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: 'Email:',
          icon: Icon(Icons.email),
          hintText: 'Input your email',
        ),
        validator: (String? value){
          if(value!.isEmpty){
            return 'กรุณากรอกอีเมล';
          }else if (!(value.contains('@'))){
            return "กรุณากรอกอีเมลให้ถูกต้อง";
          }else if (!(value.contains('.'))){
            return "กรุณากรอกอีเมลให้ถูกต้อง";
          }
        },
        onSaved: (String? value){
          email = value!.trim();
        },
      ),
    );
  }

  Widget txtPassword(){
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: TextFormField(
        obscureText: true,
        style: TextStyle(
          fontSize: 24.0,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: 'Password:',
          icon: Icon(Icons.password),
          hintText: 'Input your password',
        ),
        validator: (String? value){
          if(value!.isEmpty){
            conpwd = value;
            return 'กรุณากรอกรหัสผ่าน';
          }else if(value.length < 6){
            conpwd = value;
            return 'กรุณากรอกรหัสผ่านมากกว่า 6 ตัวอักษร';
          }else{
            conpwd = value;
          }
        },
        onSaved: (String? value){
          password = value!.trim();
          conpwd = value;
        },
      ),
    );
  }

    Widget txtconfirmPassword(){
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: TextFormField(
        obscureText: true,
        style: TextStyle(
          fontSize: 24.0,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: 'ConfirmPassword:',
          icon: Icon(Icons.password),
          hintText: 'Input your confirmPassword',
        ),
        validator: (String? value){
          if(value!.isEmpty){
            return 'กรุณายืนยันรหัสผ่าน';
          }else if(value != conpwd){
            return 'กรุณายืนยันรหัสผ่านให้ถูกต้อง';
          }
        },
        // onSaved: (String? value){
        //   confirmpassword = value!.trim();
        // },
      ),
    );
  }

  Widget btnSubmit() => 
    Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: pColor,
        ),
        onPressed: (){  
          print("hello");

          if(formKey.currentState!.validate()){
              formKey.currentState!.save();
              print("Name : $name");
              print("Surname : $surname");
              print("Email : $email");
              print("Password : $password");
              //print("ConfirmPassword : $confirmpassword");
              var local = DBLocal();   
              local.register(name, surname, email, password);                
              formKey.currentState!.reset();  
              Navigator.pushNamed(context, 'Login');
          }
        }, 
        child: Text('Submit'),
      ),
    );
}