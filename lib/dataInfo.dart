import 'package:flutter/material.dart';

class DataInfo extends StatelessWidget {
  String name;
  String? location;
  double? points;
  double? variation;
  DataInfo(this.name, this.location, this.points, this.variation);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20, 100, 20, 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Name: ' + name,
              style: TextStyle(
                  inherit: false,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Location: ' + location!,
                style: TextStyle(
                    inherit: false,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Points: ' + points.toString(),
                style: TextStyle(
                    inherit: false,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Variation: ' + variation.toString(),
                style: TextStyle(
                    inherit: false,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
