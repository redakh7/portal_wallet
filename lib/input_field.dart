import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final String content;

   InputField({required this.label, required this.content});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          children: <Widget>[
            Container(
              width: 80.0,

              child: Text(
                "$label",
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              width: 40.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3.7,
              height: 40,
              child: TextField(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                ),
                decoration: InputDecoration(
                  filled: true,
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.blueGrey,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "$content",
                  hintStyle: TextStyle(color:Colors.blueGrey),
                  fillColor: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}