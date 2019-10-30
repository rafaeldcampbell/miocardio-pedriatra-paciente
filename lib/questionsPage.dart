import 'package:flutter/material.dart';

class QuestionsPage extends StatefulWidget{
  QuestionsPageState createState() => QuestionsPageState();

}
class QuestionsPageState extends State<QuestionsPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Color.fromRGBO(253, 224, 224, 1),
            
            body: ListView.builder(
                itemCount: data.length,
                padding: EdgeInsets.all(5),
                itemBuilder: (BuildContext context, int index) =>
                Card(
                  child: EntryItem(data[index]),
                ),
            ),
      );
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    'Diferença entre miocardia e miocardite',
    <Entry>[
      Entry(
        'Section A0',
      ),
    ],
  ),
  Entry(
    'O que é miocardite?',
    <Entry>[
      Entry('É a inflamação do músculo do coração, chamado de miocárdio. Esse músculo é responsável pela contração do coração e a inflamação prejudica a ação de bombeamento do sangue provocando arritmias e insuficiência cardíaca. Seu tempo de duração depende da causa da inflamação e do estado de saúde do paciente.'),
    ],
  ),
  Entry(
    'O que miocardiopatia isquêmica?',
    <Entry>[
      Entry('Section B0'),
    ],
  ),
  Entry(
    'O que causa a inflamação no miocárdio?',
    <Entry>[
      Entry('Section C0'),
    ],
  ),
  Entry(
    'O que é cardiopatia congênita?',
    <Entry>[
      Entry('Section C0'),
    ],
  ),
];

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