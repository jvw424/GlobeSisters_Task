import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:emulate/modules/cities.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  PostPage({
    Key? key,
  }) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<String> selected = [];
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();

  Widget both() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        elevation: 20,
        child: Container(
          height: 350,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            border: Border.all(color: Colors.black54),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            children: [typeAheadList(), cityViewOption()],
          ),
        ),
      ),
    );
  }

  Widget typeAheadList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
        child: ListTile(
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          leading: Icon(Icons.pin_drop_sharp),
          title: SimpleAutoCompleteTextField(
              style: TextStyle(fontSize: 20),
              key: key,
              decoration: new InputDecoration(hintText: "Enter a City"),
              controller: TextEditingController(text: ""),
              suggestions: cities,
              submitOnSuggestionTap: true,
              clearOnSubmit: true,
              textSubmitted: (text) {
                setState(() {
                  selected.insert(0, text);
                });
              }),
        ),
      ),
    );
  }

  Widget cityViewOption() {
    if (selected.isEmpty) {
      return SizedBox.shrink();
    } else {
      return Container(
        height: 250,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: selected.length,
          itemBuilder: (context, index) => Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 25, right: 25),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
                child: ListTile(
                  tileColor: Colors.blueGrey.shade200,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  dense: true,
                  title: Center(
                    child: Text(
                      selected[index],
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  leading: SizedBox.shrink(),
                  trailing: IconButton(
                      color: Colors.red,
                      icon: Icon(Icons.highlight_remove),
                      onPressed: () {
                        setState(() {
                          selected.removeAt(index);
                        });
                      }),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white60),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Where to Next?',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            both(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.download,
          color: Colors.white70,
        ),
        onPressed: () {
          setState(() {
            selected.clear();
          });
        },
      ),
    );
  }
}
