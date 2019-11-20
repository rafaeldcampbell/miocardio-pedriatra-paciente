import 'package:flutter/material.dart';
import 'package:miocardio_paciente/functions/localization.dart' show Localization;

class QuestionsPage extends StatefulWidget {
  QuestionsPageState createState() => QuestionsPageState();
}

class QuestionsPageState extends State<QuestionsPage> {
  @override
  Widget build(BuildContext context) {
    var localization = Localization.of(context);
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
                  localization.trans('pagetitleAsk'),
                  key: Key("pagetitleAsk"),
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
  var localization = Localization.of(context);
  return <Entry>[
            Entry(
              localization.trans('askQuestion01'),
              <Entry>[
                Entry(localization.trans('askAnswer01')),
              ],
            ),
            Entry(
              localization.trans('askQuestion02'),
              <Entry>[
                Entry(localization.trans('askAnswer02')),
              ],
            ),
            Entry(
              localization.trans('askQuestion03'),
              <Entry>[
                Entry(localization.trans('askAnswer03')),
              ],
            ),
            Entry(
              localization.trans('askQuestion04'),
              <Entry>[
                Entry(localization.trans('askAnswer04')),
              ],
            ),
            Entry(
              localization.trans('askQuestion05'),
              <Entry>[
                Entry(localization.trans('askAnswer05')),
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
