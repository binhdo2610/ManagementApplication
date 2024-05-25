import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

@override
State<LoginPage> createState()=> _LoginPageState();
}
class _LoginPageState extends State<LoginPage>{
  static Color selectedColor = Colors.blue;
  static Color unSelectedColor = Colors.grey;
  //email testfield
  Color _emailBorderColor = Colors.grey;
  final _focusNodeEmail = FocusNode();
  //final _controllerEmail = TextEditingController();
  //Password test field
 // Color _passwordBorderColor = selectedColor;
  //  final _focusNodePassword = FocusNode();
 // final _controllerPassword = TextEditingController();
  @override
  void initState(){
    super.initState();
    _focusNodeEmail.addListener(_onfocusEmailChange);
  }
  @override
  void dispose(){
    super.dispose();
    _focusNodeEmail.dispose();
  }
  void _onfocusEmailChange(){
    setState((){
      _focusNodeEmail.hasFocus
      ? _emailBorderColor = selectedColor
      : _emailBorderColor = unSelectedColor;
    });
  }
  @override
  Widget build(BuildContext context){
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child:Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "libassetz5474638644392_cb80551ae47f4348bb12792bc38efc81.jpg",
                  height: 64,
                  width: 64,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(8,0,8,0),
                  decoration: BoxDecoration(
                    border: Border.all(color: _emailBorderColor),
                    borderRadius: BorderRadius.circular(8)),
                    child: TextField(
                      focusNode: _focusNodeEmail,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Email',
                        ),//input decoration
                      ),//TextField
                    ),//Container
                    const SizedBox ( 
                      height: 16,
                    ),//SizeBox
                    const TextField(
                      obscureText:true,
                       decoration:InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',

                      ),//InputDecoration
                    ),//TextField
                   ],
                  ),//Column
                ),//Center                     
            ));//Padding//Scaffold       
  }
}