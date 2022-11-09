import 'package:tuple/tuple.dart';

class User {
  int phoneNumber;
  String name;
  String email;
  String imagePath;
  String currentLocation;
  DateTime birthday;
  List<String> interests;
  List<Tuple2<String, bool>> locations;

  User({
    required this.birthday,
    this.currentLocation = '',
    this.imagePath = '',
    this.interests = const [],
    this.phoneNumber = 0,
    this.email = '',
    this.name = '',
    this.locations = const [],
  });

  String hobbiesToString() {
    String endpoint = '';
    this.interests.forEach((interest) {
      if (interest == interests.last)
        endpoint += interest;
      else {
        endpoint += interest + ', ';
      }
    });
    return endpoint;
  }
}
