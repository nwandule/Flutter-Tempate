Widget TextField( context,//pass params) {
  return Container(
                           padding: EdgeInsets.only(right: 80, left: 80),
                            child: TextFormField(
                              // textAlign: TextAlign.center,
                              validator: (value){
                                if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!) || value.isEmpty){
                                  // borderSide: BorderSide(color: Colors.cyan);
                                  return ("please enter a valid email");
                                }
                                return (null);
                              },
                              onChanged: (value) {
                                user.email = value;
                              },
                              controller: TextEditingController.fromValue(TextEditingValue(
                                  text: '${user.email == null ? "" : user.email}',

                                  selection: TextSelection.fromPosition(TextPosition(
                                      affinity: TextAffinity.downstream,
                                      offset: '${user.email}'.length)))),
                              style: const TextStyle(
                                fontSize: 18, color: Colors.grey,
                              ),

                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.all(10.0),
                                focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 1.0)),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: HexColor("#FFFFFF"),)),
                                focusedErrorBorder:OutlineInputBorder(borderSide: BorderSide(color: HexColor("#FFFFFF"),width: 1.0)),
                                errorStyle: TextStyle(color: Color.fromRGBO(232, 237, 207, 1)),
                                errorBorder:OutlineInputBorder(borderSide: BorderSide(color: HexColor("#FFFFFF"),width: 1.0)),
                                border: OutlineInputBorder(),
                                //labelText: "Email",
                                hintText: "Email Address",
                                hintStyle: TextStyle(fontSize: 20.0, color: HexColor("#FFFFFF"),),

                                //prefixIcon: Icon(Icons.alternate_email ,  color: Color(0xFF008080)),
                              ),
                            ),
                          ),
}
