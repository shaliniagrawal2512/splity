import 'dart:math';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:splity/constants.dart';
import 'package:splity/services.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

Color col = Colors.primaries[Random().nextInt(Colors.primaries.length)];

class _CreateGroupState extends State<CreateGroup> {
  final _group = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool showSpinner = false;
  @override
  void dispose() {
    _group.dispose();
    super.dispose();
  }

  List<String> res = ["Trip", "Home", "Couple", "Others"];
  String selected = "Others";
  Widget getChip(String label, IconData icon, int index) {
    return FilterChip(
        elevation: 5,
        showCheckmark: false,
        selected: selected == label ? true : false,
        selectedColor: const Color(0xff1ec677),
        label: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 5),
            Text(label),
          ],
        ),
        onSelected: (value) {
          selected = res[index];
          setState(() {});
        });
  }

  Widget getTile(String label) {
    return ListTile(
        title:
            Text(label, style: const TextStyle(fontWeight: FontWeight.w500)));
  }

  bool isSimplify = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff373445),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.cancel),
          ),
          title: const Text("Create a group"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        showSpinner = true;
                      });
                      _formKey.currentState!.save();
                      String res = await DataBases()
                          .groupCreate(_group.text, selected, isSimplify);
                      setState(() {
                        showSpinner = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(res),
                          duration: const Duration(seconds: 7)));
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Save",
                      style: TextStyle(
                          color: Color(0xff1ec677),
                          fontWeight: FontWeight.bold,
                          fontSize: 20))),
            )
          ],
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            children: [
              ListTile(
                leading: Container(
                    width: 70,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            colorFilter:
                                ColorFilter.mode(col, BlendMode.modulate),
                            fit: BoxFit.fill,
                            image: const AssetImage("assets/pattern2.jpg")),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)))),
                subtitle: TextFormField(
                  validator: (value) {
                    int i = 0;
                    while (i < value!.length && value[i] == ' ') {
                      i++;
                    }
                    if (value.isEmpty || value.length == i) {
                      return "Please Enter Group Name";
                    } else if (value.length > 30) {
                      return "Group name should be less than 30 characters";
                    }
                    return null;
                  },
                  autofocus: true,
                  controller: _group,
                  cursorColor: const Color(0xff1ec677),
                  decoration: kInputDecoration.copyWith(
                      hintText: "", contentPadding: const EdgeInsets.all(0)),
                ),
                title: const Text("Group name??",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              ),
              getTile("Type"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  getChip("Trip", Icons.flight_outlined, 0),
                  getChip("Home", Icons.home_outlined, 1),
                  getChip("Couple", Icons.favorite_outlined, 2),
                  getChip("Others", Icons.receipt_outlined, 3),
                ],
              ),
              getTile("Group members"),
              const ListTile(
                  title: Text(
                      "You will be able to add group members after you save the group"),
                  leading: Icon(Icons.group_add)),
              getTile("Advanced settings"),
              const ListTile(
                  title: Text("Simplify Group debts",
                      style: TextStyle(fontSize: 21))),
              ListTile(
                  subtitle: const Text(
                      "Automatically combine debts to reduce the total number of repayments between group members",
                      textAlign: TextAlign.justify),
                  trailing: Switch(
                    value: isSimplify,
                    onChanged: (bool value) {
                      isSimplify = value;
                      setState(() {});
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
