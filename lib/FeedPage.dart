import 'package:emulate/modules/EmailTile.dart';
import 'package:flutter/material.dart';

import 'modules/emails.dart';

class FeedPage extends StatefulWidget {
  FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    emails.shuffle();
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Material(
            elevation: 20,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white70,
            child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 86, 130, 152),
                  border: Border.all(
                    color: Colors.black45,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: ListView.builder(
                    itemCount: emails.length,
                    itemBuilder: ((context, index) {
                      return EmailTile(
                        email: emails[index],
                      );
                    })))));
  }
}
