import 'dart:math';

import 'package:flutter/material.dart';
import 'package:bersihkebun/data/dbOrder.dart';
import 'package:bersihkebun/models/order.dart';
import 'package:http/http.dart';

class BersihKebun extends StatefulWidget {
  @override
  _BersihKebunPageState createState() => new _BersihKebunPageState();
}

class hitungbiaya{
  String _luaslahan, _jenislayanan,_selectedservices;
  int _harga = 10;
  double _diskon = 0.2;
  double hargatotal;
}




class _BersihKebunPageState  extends State<BersihKebun> {

  String _luaslahan, _jenislayanan, _alamat;
  String _ordername = "Bersih Kebun", _user = "Exca";
  var _price = 50000;
  var _totalp = 50000 - (50000/2);
  var realp;
  var _diskon = 2;
  // var totalprice = _price - (_diskon *_price);

  final formKey = new GlobalKey<FormState>();
  List _layanan = [
    "Pilih Layanan",
    "Rawat",
    "Bersih",
    "Pemupukan"
  ];
  List _promo = [
    "Diskon 50%",
    "Harga Normal",




  ];
  //   _onAsu(){
  //   String _jenislayanan;
  //   if(_jenislayanan == "Rawat"){
  //
  //   }
  //   String _luaslahan,_selectedservices;
  //   int _harga = 10;
  //   double _diskon = 0.2;
  //   double hargatotal;
  //   double _pricetotal = _diskon *_harga;
  //   return _pricetotal;
  // }


  String _selectedservice, _selecteddiscount;


  @override
  Widget build(BuildContext context) {

    var PesanBtn = new RaisedButton(
      // onPressed: () {},
        onPressed: _submit,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80.0),
        ),
        child: new Text("Pesan"),
        color: Colors.teal[200]

    );
    var HitungBtn = new RaisedButton(
      // onPressed: () {},
        onPressed: _hitung,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80.0),
        ),
        child: new Text("Hitung"),
        color: Colors.teal[200]

    );


    var loginForm = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[

        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  keyboardType: TextInputType.phone,
                  onSaved: (val) => _luaslahan = val,
                  decoration: new InputDecoration(labelText: "Luas Lahan (m2)"),
                ),
              ),
              new Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: new SizedBox(

                    child: new Text("Jenis Pekerjaan "),
                    width: 350,
                    height: 20,
                  )
              ),
              new Padding(
                  padding: const EdgeInsets.all(0.0),
                  child:
                  SizedBox(
                    width: 350,
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        DropdownButton(
                          hint: Text("Pilih Layanan"),
                          value: _jenislayanan,
                          // onTap: _onAsu,
                          items: _layanan.map((value) {
                            return DropdownMenuItem(
                              child: Text(value),
                              value: value,
                            );
                          }).toList(),
                          onChanged: (value){
                            setState(() {
                              _jenislayanan = value;
                            });
                          },
                        )
                      ],
                    ),
                  )
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                    onSaved: (val) => _alamat = val,
                    decoration: new InputDecoration(labelText: "Alamat")
                ),
              ),
              new Padding(
                  padding: const EdgeInsets.all(0.0),
                  child:
                  SizedBox(
                    width: 350,
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        DropdownButton(
                          hint: Text("Pilih Kode Promo"),
                          value: _selecteddiscount,
                          // onTap: _onAsu,
                          items: _promo.map((value) {
                            return DropdownMenuItem(
                              child: Text(value),
                              value: value,
                            );
                          }).toList(),
                          onChanged: (value){
                            setState(() {
                              _selecteddiscount = value;
                              _hitung();
                            });
                          },
                        )
                      ],
                    ),
                  )
              ),


            ],
          ),
        ),

        new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child:
            new SizedBox(

              child: new Text("Total Biaya " + "Rp. $_price", style: TextStyle(height: 1, fontSize: 25),),
              width: 350,
              height: 50,
            )
        ),

        PesanBtn

      ],

    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Bersih Halaman"),
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
      if(_selecteddiscount == "Diskon 50%"){
        _price = 50000-25000;
      }
      else if (_selecteddiscount == "Harga Normal"){
        _price = 50000;
      }

      final form = formKey.currentState;

      form.save();
      var order = new Order( _ordername, _user, _price, _alamat ,_luaslahan, _jenislayanan);
      var db = new DatabaseHelper();
      db.saveOrder(order);
      Navigator.of(context).pushNamed("/history");
    });

  }
  void _hitung(){
    setState(() {
      if(_selecteddiscount == "Diskon 50%"){
        _price = 50000-25000;
      }
      else if (_selecteddiscount == "Harga Normal"){
        _price = 50000;
      }

    });

  }

}