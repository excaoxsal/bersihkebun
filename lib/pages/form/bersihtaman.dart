import 'package:flutter/material.dart';
import 'package:bersihkebun/data/database-helper.dart';
import 'package:bersihkebun/models/user.dart';

class BersihTaman extends StatefulWidget {
  @override
  _BersihTamanPageState createState() => new _BersihTamanPageState();
}



class _BersihTamanPageState  extends State<BersihTaman> {



  @override
  Widget build(BuildContext context) {

    var loginBtn = new RaisedButton(
        onPressed: (){},
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

                  decoration: new InputDecoration(labelText: "Luas Lahan"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(

                  decoration: new InputDecoration(labelText: "Jenis Pekerjaan"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(

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


}