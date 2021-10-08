import 'package:flutter/material.dart';

class CardVacinas extends StatefulWidget {
  final dynamic data;
  const CardVacinas({Key key, this.data}) : super(key: key);

  @override
  _CardVacinasState createState() => _CardVacinasState();
}

class _CardVacinasState extends State<CardVacinas> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
             ListTile(
              leading: Icon(Icons.shield),
              title: Text(widget.data["name"]),
              subtitle: Text('Te proteje contra o covid-19'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('Saiba Mais'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
