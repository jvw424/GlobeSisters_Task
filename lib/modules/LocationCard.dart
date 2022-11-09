import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LocationCard extends StatefulWidget {
  final String location;
  final bool visited;
  LocationCard({required this.location, required this.visited});

  @override
  State<LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade200,
            border: Border.all(color: Colors.black54),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          width: 150,
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Visited',
                  style: TextStyle(fontSize: 9),
                ),
                Checkbox(
                  value: widget.visited,
                  onChanged: (newVal) {},
                ),
              ],
            ),
            FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(
                  widget.location,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ]),
        ),
      ),
    );
  }
}
