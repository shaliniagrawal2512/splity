import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:splity/constants.dart';
import 'package:splity/services.dart';
import 'package:splity/user_group_model.dart';

class AddExpense extends StatefulWidget {
  const AddExpense(
      {Key? key,
      required this.inGroup,
      required this.groups,
      required this.user})
      : super(key: key);
  final bool inGroup;
  final List<OurGroup> groups;
  final OurUser user;

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

bool showSpinner = false;

class _AddExpenseState extends State<AddExpense> {
  @override
  Widget build(BuildContext context) {
    final _description = TextEditingController();
    final _amount = TextEditingController();

    final _formKey = GlobalKey<FormState>();
    DateTime selectedDate = DateTime.now();
    Future<DateTime> pickDate(BuildContext context) async {
      final initialDate = selectedDate;
      final newDate = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: DateTime(2018),
          lastDate: DateTime.now());
      if (newDate == null) return initialDate;
      return newDate;
    }

    Widget getText(String label) {
      return Text(label,
          style: const TextStyle(fontSize: 19, color: Colors.white));
    }

    Widget getContainer(IconData icon) {
      return Material(
        elevation: 10,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Icon(
            icon,
            size: 40,
          ),
          decoration: BoxDecoration(
              color: const Color(0xff373445),
              border: Border.all(color: const Color(0xff1ec677)),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff373445),
        title: const Text("Add Expense"),
        actions: [
          IconButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  showSpinner = true;
                });
                _formKey.currentState!.save();
                String res = '';
                res = await DataBases().addPersonalExpenses(_description.text,
                    _amount.text, Timestamp.fromDate(selectedDate));
                setState(() {
                  showSpinner = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(res), duration: const Duration(seconds: 7)));
                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.check, color: Color(0xff1ec677)),
          )
        ],
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              widget.inGroup
                  ? const SizedBox(height: 3)
                  : ListTile(
                      leading: const Text("Chosen Group :",
                          style: TextStyle(
                              color: Color(0xff1ec677), fontSize: 20)),
                      title: getText(""),
                    ),
              const Divider(),
              ListTile(
                  leading: getContainer(Icons.receipt_outlined),
                  title: TextFormField(
                    controller: _description,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Description";
                      } else {
                        return null;
                      }
                    },
                    decoration: kInputDecoration.copyWith(
                        hintText: "Enter a description"),
                  )),
              const SizedBox(height: 20),
              ListTile(
                  leading: getContainer(Icons.currency_rupee),
                  title: TextFormField(
                    style: const TextStyle(fontSize: 30),
                    validator: (value) {
                      if (value!.isEmpty) return "Please Enter amount";
                      return null;
                    },
                    controller: _amount,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: kInputDecoration.copyWith(
                        hintText: "0.00",
                        hintStyle: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  )),
              const SizedBox(height: 40),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                getText("Paid by  "),
                ElevatedButton(
                    onPressed: () {}, child: getText("You"), style: kStyling),
                getText("  and split  "),
                ElevatedButton(
                    onPressed: () {},
                    child: getText("Equally"),
                    style: kStyling),
              ]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ListTile(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.group, size: 30, color: Color(0xff1ec677))),
        title: const Text("Choose Group",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.camera_alt,
                    color: Color(0xff9D2228), size: 30)),
            IconButton(
              icon: const Icon(Icons.date_range),
              onPressed: () async {
                selectedDate = await pickDate(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
