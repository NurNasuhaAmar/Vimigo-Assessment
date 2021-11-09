import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ContactDetails extends StatefulWidget {

  String contactKey;

  ContactDetails({required this.contactKey});

  @override
  _ContactDetailsState createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {

  late TextEditingController _nameController,_numberController;
  String checkin = '';

  late DatabaseReference _ref;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _numberController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('Contacts');
    getContactDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Details'),
        backgroundColor: Colors.red[600],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: (){},
                  icon: Icon(
                    Icons.account_circle,
                    color: Colors.red[600],
                    size: 120,
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                tileColor: Colors.grey[100],
                leading: Icon(Icons.account_circle),
                title: Text(_nameController.text),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                tileColor: Colors.grey[100],
                leading: Icon(Icons.phone_android),
                title: Text(_numberController.text),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                tileColor: Colors.grey[100],
                leading: Icon(Icons.calendar_today_rounded),
                title: Text(checkin),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getContactDetails() async {
    DataSnapshot snapshot = await _ref.child(widget.contactKey).once();

    Map contact = snapshot.value;

    _nameController.text = contact['name'];
    _numberController.text = contact['number'];
    //_typeSelected = contact['checkin'];
    setState(() {
      checkin = contact['checkin'];
    });
  }
}


