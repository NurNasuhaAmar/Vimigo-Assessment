import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptest3/screen/add_contacts.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter_apptest3/screen/contact_details.dart';
import 'package:flutter_apptest3/screen/coin.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {

  late Query _ref;
  bool order = false;
  bool searchState = false;
  List<Contacts> userList = [];

  @override
  void initState(){
    super.initState();
    _ref = FirebaseDatabase.instance.reference().child('Contacts').orderByChild('name').startAt("Jayden Lee").endAt("Jayden Lee");
    _ref.once().then((DataSnapshot snapshot){
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, value) {
        print(values['name']);
        userList.add(values['name']);
      });
    });
  }


  Widget _buildContactItem({required Map contact}){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(5),
      height: 70,
      color: Colors.white,
      child: ListView.builder(
        reverse: order,
          itemCount: 1,
          itemBuilder: (context, index){
            return ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ContactDetails(
                    contactKey: contact['key']
                )));
              },
              title: Text(contact['name']),
              leading: Icon(
                Icons.account_circle,
                color: Colors.red[600],
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searchState ? TextField(
          onChanged: (value){
            //dataList = dataList.where((element) => element.contains(value)).toList();
            //SearchMethod(text);
          },
          style: TextStyle(color: Colors.white),
          decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              icon: Icon(Icons.search, color: Colors.white,),
            hintText: 'Search ...',
            hintStyle: TextStyle(
              color: Colors.white
            )
          ),
        ):
        Text('My Contacts'),
        backgroundColor: Colors.red[600],
        // leading: IconButton(
        //   icon: Icon(Icons.sort),
        //   onPressed: () {},
        // ),
        actions: <Widget>[
          !searchState ? IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                searchState = !searchState;
              });
            },
          ):
          IconButton(
            icon: const Icon(
              Icons.cancel,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                searchState = !searchState;
              });
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.add_call,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_){
                return AddContacts();
                //return CoinAnimation();
              }));
            },
          ),
        ],
      ),
      // body: Column(
      //   children: <Widget>[
      //     Flexible(
      //       child: FirebaseAnimatedList(
      //           query: _ref,
      //           itemBuilder: (_, DataSnapshot snapshot,
      //           Animation<double> animation, int x) {
      //             return ListTile(
      //               subtitle: Text(snapshot.value.toString()),
      //             );
      //           }),
      //     )
      //   ],
      // )
      body: SizedBox(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref, itemBuilder: (BuildContext context,
            DataSnapshot snapshot,Animation<double>animation,int index){
              Map contact = snapshot.value;
              contact['key'] = snapshot.key;
              return _buildContactItem(contact: contact);
          },
        ),
      ),
    );
  }

  // void SearchMethod(String text) async{
  //
  // DatabaseReference searchRef = FirebaseDatabase.instance.reference().child('Contacts');
  // searchRef.once().then((DataSnapshot snapShot){
  //   dataList.clear();
  //   var keys = snapShot.value.keys;
  //   var values = snapShot.value;
  //
  //   for(var key in keys){
  //     Contacts contacts = new Contacts(
  //       values [key]['name'],
  //       values [key]['phone'],
  //       values [key]['checkin'],
  //     );
  //   }
  //   });
  // }
}
