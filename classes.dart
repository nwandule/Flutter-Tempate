import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Screens/Login/login.dart';
import 'package:untitled/Screens/Registration/screen_three.dart';
import 'package:untitled/Model/user_register.dart';

class class_name extends StatefulWidget {
  //constructor
  Registration_01(//parameter);
  @override
  _class_nameState createState() => _class_nameState();
}

class _class_nameState extends State<class_name > {
  //formkey is for validation input or any validation in the form
  final _formKey = GlobalKey<FormState>();
  _class_nameState(//parameter);

  @override
  Widget build(BuildContext context){
    // return const Center(
    return Scaffold(
      backgroundColor: Colors.white ,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(

                  margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  height: 820,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white ,
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                          //inside you whatever widget you want
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:  [
                          const Image(image: AssetImage('lib/assets/images/logo/anixi01.png'), height: 200,),
                          const SizedBox(height: 20,)
                          //call your widget
                          Textbox( context,textname,parameter),
                          //space
                          const SizedBox(height:30, ),
                        ]
                    ),
                  ),
                ),
              ),
            ],
          ),
        ) ,
      ),
    );
    // );
  }
}
