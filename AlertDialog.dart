import 'dart:math';
import 'package:flutter/material.dart';

showAlertDialog(BuildContext context,String ress_val) {
  //object to create random number for orders placed by user
  Random random = Random();
  int randomNumber = random.nextInt(1000);
  // Create button
  Widget okButton = FlatButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  // Create AlertDialog
  AlertDialog alert = ress_val =="404"? AlertDialog(
    title: const Text("Service Not Working "),
    content: const Text("We Closed at moment.please place you order 30 min before delivery time"),
    actions: [
      okButton,
    ],
  ):AlertDialog(
    title: Text(ress_val=="Residence"?"Select Residence.":"Thanks Order Received"),
    content: Text(ress_val!="Residence"?"Order  K$randomNumber.":""),
    actions: [
      okButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}