import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.emoji_emotions),
        actions: [
          IconButton(
              tooltip: "Search",
              onPressed: () {},
              icon: const Icon(Icons.search)),
          IconButton(
              tooltip: "Create group",
              onPressed: () {},
              icon: const Icon(Icons.group_add)),
        ],
        backgroundColor: const Color(0xff373445),
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text("Overall, you owe INR rs 305.76",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          ListView.builder(
            padding: const EdgeInsets.only(top: 25),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Non Group Expenses",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20)),
                        SizedBox(height: 7),
                        Text(
                          "You owe 1200.00 rs",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color(0xff9D2228)),
                        ),
                        SizedBox(height: 7),
                        Text("25 Aug   2:35 pm")
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        hoverColor: const Color(0xff217A54),
        elevation: 5,
        hoverElevation: 10,
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        tooltip: "Add expenses",
        label: const Text("Add expense",
            style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold)),
        icon: const Icon(
          Icons.receipt_outlined,
          color: Colors.white,
          size: 30,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 16,
        unselectedFontSize: 14,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        backgroundColor: const Color(0xff373445),
        showUnselectedLabels: true,
        selectedItemColor: const Color(0xff1DCE77),
        unselectedItemColor: Colors.white60,
        currentIndex: index,
        onTap: (idx) {
          setState(() {
            index = idx;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Groups"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Friends"),
          BottomNavigationBarItem(icon: Icon(Icons.notes), label: "Activity"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Account"),
        ],
      ),
    );
  }
}
