import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hih/Widgets/cardVacinas.dart';

class HomeTab extends StatefulWidget {
// final Array documentList;

// HomeTab(this.documentList);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future getVacinas() async {
  var firestore = FirebaseFirestore.instance;
  var allVacinas = await firestore.collection("vacinas").get();
  List listVacinas = [];
    allVacinas.docs.forEach((doc) => {
    listVacinas.add((doc.data()))
    });
    qtdTotak = listVacinas.length;
    return listVacinas;
  }

  var qtdTotak;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getVacinas(),
        builder: (context, snapshot) {
          print(snapshot);
          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  itemCount: qtdTotak,
                  itemBuilder: (BuildContext context, int index ){
                    print(qtdTotak);
                    return ListTileTheme(
                      child: CardVacinas(data:{"name":"adadas"})
                    );
                  },),
              ],
            ),
          );
        });
  }
}
