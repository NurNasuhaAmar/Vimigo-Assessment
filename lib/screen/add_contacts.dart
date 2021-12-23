import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptest3/screen/model.dart';
import 'package:intl/intl.dart';
import 'package:flutter_apptest3/screen/contacts.dart';
import 'package:flutter_apptest3/screen/coin.dart';
import 'package:http/http.dart' as http;


class AddContacts extends StatefulWidget {
  const AddContacts({Key? key}) : super(key: key);

  @override
  _AddContactsState createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {

  //late Future<Model> futureModel;
  late TextEditingController _nameController,_numberController;
  String checkin = '';

  late DatabaseReference _ref;

  late Model model;
  List<Results> list = <Results>[];

  @override
  void initState() {
    super.initState();
    getDataFromApi();
    //futureModel = fetchModel();
    _nameController = TextEditingController();
    _numberController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('Contacts');
  }

  Future getDataFromApi() async {
    final url = await http.get(Uri.parse('https://randomuser.me/api/'));
    //final url = await http.get("https://randomuser.me/api/");
    model = Model.fromJson(jsonDecode(url.body));
    //print(url.body);
    setState(() {
      list = model.results;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Contact'),
        backgroundColor: Colors.red[600],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                    hintText: 'Enter Name',
                    prefixIcon: const Icon(Icons.account_circle, size:30, color: Colors.grey,),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.all(15),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            color: Colors.redAccent
                        )
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _numberController,
                decoration: InputDecoration(
                    hintText: 'Enter Phone No.',
                    prefixIcon: const Icon(Icons.phone, size:30, color: Colors.grey,),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.all(15),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            color: Colors.redAccent
                        )
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 200,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal : 10),
                // ignore: deprecated_member_use
                child: RaisedButton(
                  child: const Text('Save Contact', style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                  ),),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {
                    popupNotification(context);
                    //saveContact();
                  },
                  color: Colors.red[600],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                    children: const <Widget>[
                      Expanded(
                          child: Divider(
                            color: Colors.black,
                            height: 50,
                          )
                      ),
                      Text("  OR  "),
                      Expanded(
                          child: Divider(
                            color: Colors.black,
                            height: 50,
                          )
                      ),
                    ]
                ),
              ),
              Container(
                width: 220,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal : 10),
                // ignore: deprecated_member_use
                child: RaisedButton(
                  child: const Text('Generate Random User', style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                  ),),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {
                    popupNotificationRandom(context);
                    //saveContact();
                  },
                  color: Colors.red[600],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const CoinAnimation(),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void popupNotification(BuildContext context){
    var alertDialog = AlertDialog(
      title: const Text('Successful'),
      content: const Text('Click OK to continue'),
      actions: <Widget>[
        // ignore: deprecated_member_use
        FlatButton(onPressed: (){
          saveContact(context);
        },
            child: const Text('OK')
        ),
      ],
    );
    showDialog(context: context, builder: (BuildContext context){
      return alertDialog;
    });
    //saveContact();
  }

  void popupNotificationRandom(BuildContext context){
    var alertDialog = AlertDialog(
      title: const Text('Successful'),
      content: const Text('Click OK to continue'),
      actions: <Widget>[
        // ignore: deprecated_member_use
        FlatButton(onPressed: (){
          generateContact(context);
        },
            child: const Text('OK')
        ),
      ],
    );
    showDialog(context: context, builder: (BuildContext context){
      return alertDialog;
    });
    //saveContact();
  }

  void saveContact(BuildContext context){
    String name = _nameController.text;
    String number = _numberController.text;

    final now = DateTime.now();

    checkin = DateFormat('d-MMM-y hh:mm').format(now);

    Map<String,String> contact = {
      'name':name,
      'number': number,
      'checkin': checkin,
    };

    _ref.push().set(contact).then((value) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Contacts()),
            (Route<dynamic> route) => false,
      );
    });
  }

  void generateContact(BuildContext context){
    int i = 0;
    final k = list[i];
    final now = DateTime.now();

    checkin = DateFormat('d-MMM-y hh:mm').format(now);

    String name = k.name.first + ' ' + k.name.last;

    Map<String,String> contact = {
      'name': name,
      'number': k.phone,
      'checkin': checkin,
    };

    _ref.push().set(contact).then((value) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Contacts()),
            (Route<dynamic> route) => false,
      );
    });
  }
}