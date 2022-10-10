import 'package:flutter/material.dart';
Widget dropdown( context,//passparams) {
  return Container(
                            padding: EdgeInsets.only(right: 80, left: 80),
                            child: DropdownButtonFormField<String>(
                              dropdownColor:  Color.fromRGBO(232, 237, 207, 1),
                              validator: (value){
                                if (value == 'Gender' || value!.isEmpty){
                                  return ("please select a gender");
                                }
                                return (null);
                              },
                              isExpanded: true,
                              iconEnabledColor: Colors.white,
                              iconDisabledColor: Colors.white,
                              value: dropdownValue,
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });

                              },
                              items: <String>['Gender','male', 'female', 'other']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                    value: value,
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child:
                                        Text(value,
                                            style: TextStyle(color:value=='Gender'? HexColor("#FFFFFF"):Colors.grey,fontSize: 20.0)
                                        )
                                    )
                                );
                              }).toList(),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.all(10.0),                              focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 1.0)),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: HexColor("#FFFFFF"),)),
                                border: OutlineInputBorder(),

                                //labelText:'Select gender',
                                hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey,),
                                //prefixIcon: Padding(padding: EdgeInsets.all(0), child: SizedBox(width:40)),
                                focusedErrorBorder:OutlineInputBorder(borderSide: BorderSide(color: HexColor("#FFFFFF"),width: 1.0)),
                                errorStyle: TextStyle(color: Color.fromRGBO(232, 237, 207, 1)),
                                errorBorder:OutlineInputBorder(borderSide: BorderSide(color: HexColor("#FFFFFF"),width: 1.0)),

                                // prefixIcon: Icon(Icons.transgender ,  color: Color(0xFF008080)),
                              ),
                            ),
                          );
}
