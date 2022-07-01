import 'package:flutter/material.dart';

class Totals extends StatefulWidget {
  const Totals({Key? key}) : super(key: key);

  @override
  State<Totals> createState() => _TotalsState();
}

class _TotalsState extends State<Totals> {
  String initialValue = "All time";
  @override
  Widget build(BuildContext context) {
    DropdownMenuItem<String> getItem(String label) {
      return DropdownMenuItem(
        value: label,
        child: Text(label),
      );
    }

    Widget getTile(String label1, String label2, Color color) {
      return ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(label1), const SizedBox(height: 6)],
          ),
          subtitle: Text(label2,
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, color: color)));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Group spending summary",
            style: TextStyle(fontSize: 20)),
        backgroundColor: const Color(0xff373445),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const ListTile(
              title: Text("Sangam Trip", style: TextStyle(fontSize: 25))),
          ListTile(
            leading: DropdownButton<String>(
                dropdownColor: const Color(0xff4b3e5c),
                value: initialValue,
                items: [
                  getItem("All time"),
                  getItem("This month"),
                  getItem("Last month"),
                ],
                onChanged: (newValue) {
                  setState(() {
                    initialValue = newValue!.toString();
                  });
                }),
          ),
          getTile(
              "TOTAL GROUP SPENDING", "INR rs 289.00", const Color(0xff9d2228)),
          getTile(
              "TOTAL YOU PAID FOR", "INR rs 289.00", const Color(0xff1ec677)),
          getTile("YOUR TOTAL SHARE", "INR rs 289.00", const Color(0xff818180)),
        ],
      ),
    );
  }
}
