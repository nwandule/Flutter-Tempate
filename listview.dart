

class Shops extends StatefulWidget {
  const Shops({Key? key}) : super(key: key);
  @override
  _shopsState createState() => _shopsState();
}

class _shopsState extends State<Shops> {
  String? downloadURL;
  int next_id=0;
  final database=FirebaseDatabase.instance.reference();

  Future getData() async {
    try {
      await downloadURLExample();
      return downloadURL;
    } catch (e) {
      debugPrint("Error - $e");
      return null;
    }
  }

  Future<void> downloadURLExample() async {
    downloadURL = await FirebaseStorage.instance
        .ref()
        .child("profilepic.jpg")
        .getDownloadURL();
    debugPrint(downloadURL.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          toolbarHeight: 85,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text('kaSh-D',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 20.0, fontWeight: FontWeight.bold,
                  color: Colors.white)),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.ac_unit_rounded, color: Colors.white),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => UploadShop(next_id)));
              },
            ),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
              color:Color.fromRGBO(46, 61, 54, 1),
            ),
          )
      ),
      body:StreamBuilder(
        stream: database.child('Shops').orderByChild('id').onValue,
        builder: (context, snapshot) {
          List<Aboutshop> messageList = [];
          if (snapshot.hasData &&
              snapshot.data != null &&
              (snapshot.data! as DatabaseEvent).snapshot.value !=
                  null) {
            final myMessages = Map<dynamic, dynamic>.from(
                (snapshot.data! as DatabaseEvent).snapshot.value
                as Map<dynamic, dynamic>); //typecasting
            myMessages.forEach((key, value) {
              final currentMessage = Map<String, dynamic>.from(value);
              messageList.add(Aboutshop(
                  currentMessage['shopname'],
                  currentMessage['image'],
                  currentMessage['id'],
                  currentMessage['service']
              ));
            }); //
            print(myMessages.keys.elementAt(0));// created a class called message and added all messages in a List of class message
            next_id=messageList.length;
            return  ListView.builder(
                itemCount: messageList.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 16),
                itemBuilder: (BuildContext context,int index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Shop_Menu(messageList[index].shopname,messageList[index].id,messageList[index].service)));
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: 230,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0,
                            ),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: (messageList[messageList[index].id].image),
                            imageBuilder: (context, imageProvider) => Container(
                              width: 130.0, height: 130.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),),
                            ),
                            placeholder: (context, url) => const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: LinearProgressIndicator(color: Colors.white,),
                              ),
                            ),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                          padding:  const EdgeInsets.only(right: 0),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 150, left: 20),
                          child: InkWell(
                            onTap: ()  {
                              if(messageList[messageList[index].id].service==0) {
                                database.child('Shops').child(
                                    myMessages.keys.elementAt(index)).update(
                                    {'service': 404}).then((value) =>
                                    print("Shop Closed")).catchError((error) =>
                                    print("you got error $error"));
                              }
                              if(messageList[messageList[index].id].service==404) {
                                database.child('Shops').child(
                                    myMessages.keys.elementAt(index)).update(
                                    {'service': 0}).then((value) =>
                                    print("Shop Closed")).catchError((error) =>
                                    print("you got error $error"));
                              }
                              setState(() {
                                var snackBar = const SnackBar(
                                  content: Text('success: Closed the shop.', style: TextStyle(
                                    color: Colors.black,
                                  ),),
                                  backgroundColor: Colors.greenAccent,
                                );

                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              });
                            },

                            child:Text(
                              messageList[messageList[index].id].service ==0 ?
                            messageList[messageList[index].id].shopname:"Closed",
                            overflow: TextOverflow.fade,
                            softWrap: false,
                            maxLines: 2,
                            style:TextStyle(
                              fontSize: 30,
                              color: messageList[messageList[index].id].service ==0?Colors.white:Colors.redAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
            );
          } else {
            return const Center(
              child: Text(
                'loading...',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w400),
              ),
            );
          }
        },
      ),
      //bottomNavigationBar:bottom_bar(context),
    );
  }
}
