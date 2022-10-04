import 'package:flutter/material.dart';
Widget app_bar(String title, context) {
  return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      toolbarHeight: 85,
      centerTitle: true,
      leading:IconButton(
        icon: const Icon(Icons.account_balance_outlined, color:Colors.white),
        onPressed: () {
          },
      ),
      title:  Text(title,
          style: const TextStyle(
              fontFamily: 'Varela',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white)),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.ac_unit_rounded, color:Colors.white),
          onPressed: () {
            //Navigator.push(context, MaterialPageRoute(builder: (context) =>nextPage()));
          },
        ),
      ],
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
          color:  Color.fromRGBO(46, 61, 54, 1),
        ),
      )
  );
}