import 'package:firebase_database/firebase_database.dart';
import 'package:flame/components.dart';
import 'package:flame/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_apptest3/screen/contacts.dart';
import 'package:flutter_apptest3/screen/coin.dart';
import 'package:flame/flame.dart';


class AddContacts extends StatefulWidget {
  const AddContacts({Key? key}) : super(key: key);

  @override
  _AddContactsState createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {

  late TextEditingController _nameController,_numberController;
  String _typeSelected = '';
  String checkin = '';

  late DatabaseReference _ref;

  //final animationData = SpriteAnimationData.sequenced(amount: 35, stepTime: , textureSize: textureSize)
  Future<void> onLoad() async {
    final coins = await Flame.images.load('coins.png');
    var _animation = SpriteAnimation.fromFrameData(
      coins,
      //Flame.images.fromCache('animation.png'),
      SpriteAnimationData.sequenced(amount: 35, stepTime: 1.0, textureSize: Vector2.all(50)),
    );

    Center(
      child: SpriteAnimationWidget(
        animation: _animation,
      ),
    );
  }



  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _numberController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('Contacts');
  }

  Widget _buildContactType(String title){
    return InkWell(
      child: Container(
        height: 40,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: _typeSelected == title ? Colors.green : Theme.of(context).accentColor,
        ),
        child: Center(
          child: Text(title, style: TextStyle(fontSize: 18,
              color: Colors.white),
          ),
        ),
      ),
      onTap: (){
        setState(() {
          _typeSelected = title;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Contact'),
        backgroundColor: Colors.red[600],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                    hintText: 'Enter Name',
                    prefixIcon: Icon(Icons.account_circle, size:30, color: Colors.grey,),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(15),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Colors.redAccent
                        )
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _numberController,
                decoration: InputDecoration(
                    hintText: 'Enter Phone No.',
                    prefixIcon: Icon(Icons.phone, size:30, color: Colors.grey,),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(15),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Colors.redAccent
                        )
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 200,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal : 10),
                child: RaisedButton(
                  child: Text('Save Contact', style: TextStyle(
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
              SizedBox(
                height: 15,
              ),
              CoinAnimation(),
              //Flame.util.animationAsWidget(Position(256, 256), animation.Animation.sequenced('animation.png', 20, textureWidth: 96))
            ],
          ),
        ),
      ),
    );
  }

  void popupNotification(BuildContext context){
    var alertDialog = AlertDialog(
      title: Text('Successful'),
      content: Text('Click OK to continue'),
      actions: <Widget>[
        FlatButton(onPressed: (){
          // Navigator.push(context, MaterialPageRoute(builder: (_){
          //   return Contacts();
          // }));
          saveContact(context);
        },
            child: Text('OK')
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

    checkin = DateFormat('dd-MM-yyyy hh:mm').format(now);

    Map<String,String> contact = {
      'name':name,
      'number': number,
      'checkin': checkin,
      //'type':_typeSelected,
    };

    _ref.push().set(contact).then((value) {
      //Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (_){
        return Contacts();
      }));
    });
  }
}