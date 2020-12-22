import 'package:flutter/material.dart';
import 'package:bersihkebun/widgets/grab_icon_menu.dart';
import 'package:bersihkebun/widgets/grab_more_icon_menu.dart';
import 'package:bersihkebun/pages/form/bersihtaman.dart';

import '../../constant.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 130 + MediaQuery.of(context).viewPadding.top,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF138880),
                        Color(0xFF1C9E82),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.white,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                        15.0 + MediaQuery.of(context).viewPadding.top),
                    child: Center(
                      child: Text(
                        "Selamat Datang",
                        style: kGrabWhiteRegularSmall,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pilih Layanan",
                                style:
                                    kGrabBlackBoldMedium.copyWith(fontSize: 20),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Text("RP",
                                    style: kGrabBlackRegularSmall.copyWith(
                                        color: Colors.grey)),
                              ),
                              Text(
                                "0",
                                style: kGrabBlackBoldMedium.copyWith(
                                    color: Colors.black, fontSize: 20),
                              ),
                              SizedBox(width: 10),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  color: Colors.grey[300],
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              RaisedButton(
                              child: GrabIconMenu(
                                image: "assets/images/pay/pay.png",
                                title: "Pay",
                              ), onPressed: () {  },
                                color: Colors.white,
                              ),
                              RaisedButton(
                              child: GrabIconMenu(
                                image: "assets/images/pay/topu.png",
                                title: "Kode Promo",
                              ), onPressed: () {  },
                                color: Colors.white,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                  child: GrabIconMenu(
                    image: "assets/images/feature/car.png",
                    title: "Bersih Kebun",
                  ), onPressed: () { Navigator.of(context).pushNamed('/form'); },
                    color: Colors.white,

                  ),
                  RaisedButton(
                    child: GrabIconMenu(
                      image: "assets/images/feature/car.png",
                      title: "Bersih Halaman",
                    ), onPressed: () { Navigator.of(context).pushNamed('/form'); },

                    color: Colors.white,
                  ),




                ],
              ),

              SizedBox(height: 15),

            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    child: GrabIconMenu(
                      image: "assets/images/feature/car.png",
                      title: "Bersih Taman",
                    ), onPressed: () { Navigator.of(context).pushNamed('/form'); },
                    color: Colors.white,

                  ),
                  RaisedButton(
                    child: GrabIconMenu(
                      image: "assets/images/feature/car.png",
                      title: "Bersih Jalan",
                    ), onPressed: () { Navigator.of(context).pushNamed('/form'); },
                    color: Colors.white,

                  ),




                ],
              ),

              SizedBox(height: 20),

            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 8,
          color: Colors.grey[300],
        ),

      ],
    );
  }
}
