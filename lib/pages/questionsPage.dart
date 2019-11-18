import 'package:flutter/material.dart';
import 'package:miocardio_paciente/generated/i18n.dart';

class QuestionsPage extends StatefulWidget {
  QuestionsPageState createState() => QuestionsPageState();
}

class QuestionsPageState extends State<QuestionsPage> {
  @override
  Widget build(BuildContext context) {
    final List<Entry> data = EntryData.getData(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 224, 224, 1),
      body: ListView.builder(
          itemCount: data.length + 1,
          padding: EdgeInsets.all(5),
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Container(
                padding: EdgeInsets.only(top: 30, bottom: 10),
                child: Text(
                  S.of(context).pagetitleAsk,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            } else {
              return Card(
                child: EntryItem(data[index - 1]),
              );
            }
          }),
    );
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

class EntryData{

  static List<Entry> getData(BuildContext context){
  // The entire multilevel list displayed by this app.
  return <Entry>[
            Entry(
              S.of(context).askQuestion01,
              <Entry>[
                Entry(S.of(context).askAnswer01),
              ],
            ),
            Entry(
              S.of(context).askQuestion02,
              <Entry>[
                Entry(S.of(context).askAnswer02),
              ],
            ),
            Entry(
              S.of(context).askQuestion03,
              <Entry>[
                Entry(S.of(context).askAnswer03),
              ],
            ),
            Entry(
              S.of(context).askQuestion04,
              <Entry>[
                Entry(S.of(context).askAnswer04),
              ],
            ),
            Entry(
              S.of(context).askQuestion05,
              <Entry>[
                Entry(S.of(context).askAnswer05),
              ],
            ),
          ];
  }
}


// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
