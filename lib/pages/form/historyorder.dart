import 'package:flutter/material.dart';
//letak package folder flutter
import 'package:bersihkebun/data/dbOrder.dart';
import 'package:bersihkebun/models/order.dart';
import 'package:sqflite/sqflite.dart';
import 'package:bersihkebun/pages/trycontact/entryform.dart';
//untuk memanggil fungsi yg terdapat di daftar pustaka sqflite
import 'dart:async';
//pendukung program asinkron

class Orders extends StatefulWidget {
  @override
  OrdersState createState() => OrdersState();
}

class OrdersState extends State<Orders> {

  DatabaseHelper dbHelper = DatabaseHelper();
  int count = 0;
  List<Order> orderList;

  @override
  Widget build(BuildContext context) {
    if (orderList == null) {
      orderList = List<Order>();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('History Pemesanan'),
      ),
      body: createListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Tambah Data',
        onPressed: () async {
          updateListView();
        },
      ),
    );
  }

  Future<Order> navigateToEntryForm(BuildContext context, Order order) async {
    var result = await Navigator.push(
        context,
        MaterialPageRoute(
            // ignore: missing_return
            builder: (BuildContext context) {
              // return EntryForm(order);
            }
        )
    );
    return result;
  }

  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.subhead;
    int index;
    return ListView.builder(
      itemCount: count,

      itemBuilder: (BuildContext context, index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.people),
            ),
            title: Text(this.orderList[index].ordername, style: textStyle,),
            subtitle: Text(this.orderList[index].jenislayanan),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () {
                deleteOrder(orderList[index]);
              },
            ),
            onTap: () async {
              var contact = await navigateToEntryForm(context, this.orderList[index]);
              if (contact != null) editOrder(contact);
            },
          ),
        );
      },
    );
  }
  //buat contact
  void addOrder(Order object) async {
    int result = await dbHelper.saveOrder(object);
    if (result > 0) {
      updateListView();
    }
  }
  //edit contact
  void editOrder(Order object) async {
    // int result = await dbHelper.update(object);
    // if (result > 0) {
    //   updateListView();
    // }
  }
  //delete contact
  void deleteOrder(Order object) async {
    // int result = await dbHelper.delete(object.id);
    // if (result > 0) {
    //   updateListView();
    // }
  }
  //update contact
  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Order>> orderListFuture = dbHelper.getOrderList();
      orderListFuture.then((orderList) {
        setState(() {
          this.orderList = orderList;
          this.count = orderList.length;
        });
      });
    });
  }

}