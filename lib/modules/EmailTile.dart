import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

// ignore: must_be_immutable
class EmailTile extends StatelessWidget {
  String email;
  EmailTile({
    this.email = '',
  });

  @override
  Widget build(BuildContext context) {
    int idx1 = this.email.indexOf('@');
    int idx2 = this.email.indexOf('.');
    String domain = email.substring(idx1 + 1, idx2);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        height: 50,
        child: Material(
          borderRadius: BorderRadius.circular(20),
          child: (ListTile(
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            title: Text(this.email),
            leading: Image(
              image: AssetImage('assets/' + domain + '_icon.png'),
              height: 25,
              alignment: Alignment.topLeft,
            ),
          )),
        ),
      ),
    );
  }
}
