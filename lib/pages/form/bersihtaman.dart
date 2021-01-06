import 'package:flutter/material.dart';
import 'package:bersihkebun/data/database-helper.dart';
import 'package:bersihkebun/models/order.dart';

class BersihTaman extends StatefulWidget {
  @override
  _BersihTamanPageState createState() => new _BersihTamanPageState();
}



class _BersihTamanPageState  extends State<BersihTaman> {

String _luaslahan, _jenislayanan, _alamat;
String _ordername = "Bersih Taman", _user = "Exca";
int _price = 50000;


  @override
  Widget build(BuildContext context) {

    var loginBtn = new RaisedButton(
        // onPressed: () {},
        onPressed: _submit,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80.0),
        ),
        child: new Text("Pesan"),
        color: Colors.teal[200]

    );


    var loginForm = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[

        new Form(

          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  onSaved: (val) => _luaslahan = val,
                  decoration: new InputDecoration(labelText: "Luas Lahan"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  onSaved: (val) => _jenislayanan = val,
                  decoration: new InputDecoration(labelText: "Jenis Pekerjaan"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  onSaved: (val) => _alamat = val,
                  decoration: new InputDecoration(labelText: "Alamat")
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(


                  decoration: new InputDecoration(
                    labelText: "Password",


                  ),
                ),
              )
            ],
          ),
        ),
        loginBtn
      ],
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Bersih Taman"),
        backgroundColor: Colors.teal[300],
      ),

      body: new Container(
        child: new Center(
          child: loginForm,
        ),
      ),
    );
  }
void _submit(){
    setState(() {
      var order = new Order( _ordername, _user, _price, _alamat ,_luaslahan, _jenislayanan, _alamat);
      var db = new DatabaseHelper();
      db.saveOrder(order);
      Navigator.of(context).pushNamed("/home");
    });

}

}