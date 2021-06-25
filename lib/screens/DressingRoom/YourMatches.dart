import 'package:flutter/material.dart';

class YourMatches extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Container(
          child: Card(
            margin: EdgeInsets.all(10),
            color: Colors.white,
            elevation: 10.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            child: Container(
              alignment: Alignment.center,
              height: 657,
              width: 340,
              child: Image.network(
                "https://bsmedia.business-standard.com/_media/bs/theme/faq_view_all/images/no-result-found.png",
                fit: BoxFit.fill,
                height: 200,
                width: 200,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
