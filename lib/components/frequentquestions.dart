import 'package:findcovid_19/config/palette.dart';
import 'package:flutter/material.dart';

class FAQ extends StatefulWidget {
  FAQ({Key key}) : super(key: key);

  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primaryColor,
        brightness: Brightness.dark,
        elevation: 0.0,
        title: Text("Frequently Asked Questions"),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.black,
        ),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) => EntryItem(
          data[index],
        ),
      ),
    );
  }
}

class Entry {
  final String title;
  final List<Entry>
      children; // Since this is an expansion list ...children can be another list of entries
  Entry(
    this.title, [
    this.children = const <Entry>[],
  ]);
}

final List<Entry> data = <Entry>[
  Entry(
    '1. What is Covid Jagratha?',
    <Entry>[
      Entry(
        'Covid Jagratha is a digital service, primarily a mobile application, developed by the Government of India and is aimed at protecting the citizens during COVID-19. It is designed to augment the initiatives of the Government of India by informing the people of their potential risk of COVID-19 infection and the best practices to be followed to stay healthy, as well as providing them relevant and curated medical advisories, as per MoHFW and ICMR guidelines, pertaining to the COVID-19 pandemic.',
      ),
    ],
  ),
  // Second Row
  Entry(
    '2. What are the key features of Covid Jagratha',
    <Entry>[
      Entry(
          'The key features of Aarogya Setu include:\n  1.Emergency COVID-19 Helpline contacts\n  2. Realtime updates on Global Covid Cases\n  3.Realtime updates on Contrywise Covid Cases\n  4. Realtime updates on India and Statewise covid cases\n  5.Notification Covid-19\n  6.Statewise Covid Hospital and beds counts'),
    ],
  ),
  Entry(
    '3. Is Covid Jagratha available in multiple languages?',
    <Entry>[
      Entry(
          'No, Covid Jagratha is currently available in one language, English'),
    ],
  ),
  Entry(
    '4. Which operating systems does Covid Jagratha support??',
    <Entry>[
      Entry(
          'Covid Jagratha is available for iOS, Android users. Covid Jagratha currently supports Android 5.0 and above, and iOS 10.3 and above.'),
    ],
  ),
  Entry(
    '5. How do you collect the information in Covid Jagratha??',
    <Entry>[
      Entry(
          'Covid Jagratha collect the data from throgh Some of the covid API.'),
    ],
  ),
  Entry(
    '6. How do I share feedback and suggestions for Covid Jagratha?',
    <Entry>[
      Entry(
          'In future we gonna launch this product inn playstore and there you can leave your comments.'),
    ],
  ),
  Entry(
    '7. How do you provide security to the user contact in Covid jagratha??',
    <Entry>[
      Entry(
          'We never share user contact  with anyone and its authenticated diirectly by the Google API.'),
    ],
  ),
];

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);
  final Entry entry;

  // This function recursively creates the multi-level list rows.
  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return ListTile(
        title: Text(
          root.title,
          textAlign: TextAlign.justify,
        ),
      );
    }
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(
        root.title,
        style: TextStyle(color: Palette.primaryColor),
        textAlign: TextAlign.justify,
      ),
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
