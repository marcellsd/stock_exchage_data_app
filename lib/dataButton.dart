import 'package:flutter/material.dart';
import './dataInfo.dart';

class DataButton extends StatelessWidget {
  late Map<dynamic, dynamic> data;
  late String stock;
  late String? name;
  late String? location;
  late double? points;
  late double? variation;

  DataButton(data, stock) {
    this.data = data;
    this.stock = stock;
    this.name = data[stock]['name'];
    this.location = data[stock]['location'];
    this.points = data[stock]['points'];
    this.variation = data[stock]['variation'];
  }

  @override
  Widget build(BuildContext context) {
    void getInfo() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DataInfo(name!, location, points, variation)));
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
      child: ElevatedButton(
        onPressed: getInfo,
        child: Text(stock),
      ),
    );
  }
}
