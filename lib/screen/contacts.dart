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
  int sort = 1;

  @override
  void initState(){
    super.initState();
    _ref = FirebaseDatabase.instance.reference().child('Contacts').orderByChild('name');
    _ref.once().then((DataSnapshot snapshot){
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, value) {
        print(value['name']);
        //userList.add(values['name']);
      });
    });

  }


  Widget _buildContactItem({required Map contact}){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(5),
      height: 70,
      color: Colors.white,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
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
            searchKey = value;
            SearchMethod(value);
            setState(() {
              !searchState;
            });
          },
          style: const TextStyle(color: Colors.white),
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
        const Text('My Contacts'),
        backgroundColor: Colors.red[600],
        leading : IconButton(
          icon: const Icon(
            Icons.sort,
            color: Colors.white,
          ),
          onPressed: () {
            if(sort == 1){
              _ref = FirebaseDatabase.instance.reference().child('Contacts');
              sort = 0;
            } else {
              _ref = FirebaseDatabase.instance.reference().child('Contacts').orderByChild('name');
              sort = 1;
            }
            setState(() {
              searchState;
            });
          },
        ),
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
              _ref = FirebaseDatabase.instance.reference().child('Contacts').orderByChild('name');
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
                return const AddContacts();
              }));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              child: SizedBox(
                height: 650,
                child: buildList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildList() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: FirebaseAnimatedList(
          key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,Animation<double>animation,int index){
          Map contact = snapshot.value;
          contact['key'] = snapshot.key;
          return _buildContactItem(contact: contact);
        },
      ),
    );
  }

  void SearchMethod(String text) {
    _ref = FirebaseDatabase.instance.reference().child('Contacts').orderByChild('name').startAt(searchKey).endAt(searchKey + '\uf8ff');
  }
}
