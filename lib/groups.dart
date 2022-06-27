import 'package:flutter/material.dart';

class Groups extends StatelessWidget {
  const Groups({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
        ));
  }
}
