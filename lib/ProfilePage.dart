import 'package:age_calculator/age_calculator.dart';
import 'package:emulate/modules/LocationCard.dart';
import 'package:flutter/material.dart';
import 'modules/User.dart';

// ignore: must_be_immutable
class ProfilePage extends StatefulWidget {
  User user;

  ProfilePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    DateDuration age = AgeCalculator.age(widget.user.birthday);

    print('Your age is' + age.years.toString());

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white70,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white70,
            border: Border.all(
              color: Colors.black45,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: ListView(
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade200,
                      border: Border.all(color: Colors.black54),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            widget.user.name,
                            style: TextStyle(color: Colors.black87),
                          )),
                    ),
                  )),
              Container(
                height: 125,
                width: 125,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 3,
                      color: Colors.black.withOpacity(.3),
                      offset: Offset(0, 8),
                    )
                  ],
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage('assets/' + widget.user.imagePath)),
                ),
              ),
              Container(
                height: 13,
                width: MediaQuery.of(context).size.width * 8,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text('Age:' + age.years.toString(),
                      style: TextStyle(fontSize: 12, color: Colors.black54)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                  initialValue: widget.user.email,
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    labelText: 'email',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  readOnly: true,
                  enabled: false,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
                child: TextFormField(
                  enabled: false,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                  initialValue: widget.user.currentLocation,
                  decoration: InputDecoration(
                    icon: Icon(Icons.location_city),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    labelText: 'location',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  readOnly: true,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
                child: TextFormField(
                  enabled: false,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                  initialValue: widget.user.hobbiesToString(),
                  decoration: InputDecoration(
                    icon: Icon(Icons.sports_handball_sharp),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    labelText: 'Hobbies',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  readOnly: true,
                ),
              ),
              Container(
                height: 13,
                width: MediaQuery.of(context).size.width * 8,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text('My Places',
                      style: TextStyle(fontSize: 12, color: Colors.black54)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Container(
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.user.locations.length,
                      itemBuilder: (context, index) {
                        return LocationCard(
                            location: widget.user.locations[index].item1,
                            visited: widget.user.locations[index].item2);
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
