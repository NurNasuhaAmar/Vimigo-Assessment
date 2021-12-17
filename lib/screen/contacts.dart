import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptest3/screen/add_contacts.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter_apptest3/screen/contact_details.dart';

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
  late String searchKey = '';

  @override
  void initState(){
    super.initState();
    _ref = FirebaseDatabase.instance.reference().child('Contacts').orderByChild('name');
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
        // title: searchState ? TextField(
        //   onChanged: (value){
        //     _ref.once().then((DataSnapshot data){
        //       print(data.value);
        //       print(data.key);
        //
        //       setState(() {
        //         _ref.equalTo(value);
        //       });
        //       //_ref = FirebaseDatabase.instance.reference().child('Contacts').orderByChild('name').startAt(value).endAt(value+"\uf8ff");
        //     });
        //     //dataList = dataList.where((element) => element.contains(value)).toList();
        //     //SearchMethod(text);
        //   },
        //   style: TextStyle(color: Colors.white),
        //   decoration: const InputDecoration(
        //       enabledBorder: UnderlineInputBorder(
        //         borderSide: BorderSide(color: Colors.white),
        //       ),
        //       focusedBorder: UnderlineInputBorder(
        //         borderSide: BorderSide(color: Colors.white),
        //       ),
        //       icon: Icon(Icons.search, color: Colors.white,),
        //     hintText: 'Search ...',
        //     hintStyle: TextStyle(
        //       color: Colors.white
        //     )
        //   ),
        // ):
        title : const Text('My Contacts'),
        backgroundColor: Colors.red[600],
        // leading: IconButton(
        //   icon: Icon(Icons.sort),
        //   onPressed: () {},
        // ),
        actions: <Widget>[
          // !searchState ? IconButton(
          //   icon: const Icon(
          //     Icons.search,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {
          //     setState(() {
          //       searchState = !searchState;
          //     });
          //   },
          // ):
          // IconButton(
          //   icon: const Icon(
          //     Icons.cancel,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {
          //     setState(() {
          //       searchState = !searchState;
          //     });
          //   },
          // ),
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              onSubmitted: (value){
                searchKey = value;
                FirebaseAnimatedList(
                  query: _ref.equalTo(searchKey), itemBuilder: (BuildContext context,
                    DataSnapshot snapshot,Animation<double>animation,int index){
                  Map contact = snapshot.value;
                  contact['key'] = snapshot.key;
                  return _buildContactItem(contact: contact);
                },
                );
              },
              onChanged: (value){
                searchKey = value;
                _ref.once().then((DataSnapshot data){
                  print(data.value);
                  print(data.key);

                  setState(() {
                    //buildList();
                  });
                  //_ref = FirebaseDatabase.instance.reference().child('Contacts').orderByChild('name').startAt(value).endAt(value+"\uf8ff");
                });
                //dataList = dataList.where((element) => element.contains(value)).toList();
                //SearchMethod(text);
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search)
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: 650,
                //width: 400,
                child: buildList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildList() {
    return FirebaseAnimatedList(
      query: _ref, itemBuilder: (BuildContext context,
        DataSnapshot snapshot,Animation<double>animation,int index){
      Map contact = snapshot.value;
      contact['key'] = snapshot.key;
      return _buildContactItem(contact: contact);
    },
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
