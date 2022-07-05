import 'package:cloud_firestore/cloud_firestore.dart';

class OurUser {
  String uid;
  String email;
  String name;
  Timestamp accountCreated;
  List<dynamic> groups;
  List<dynamic> friends;
  List<dynamic> activity;
  List<dynamic> expenses;
  int? qrCode;
  OurUser(
      {required this.uid,
      required this.email,
      required this.name,
      required this.accountCreated,
      required this.groups,
      required this.friends,
      required this.activity,
      required this.expenses,
      this.qrCode});
}

class OurGroup {
  String id;
  String name;
  String creater;
  List<dynamic> members;
  Timestamp groupCreated;
  String type;
  bool simplifyDebt;
  Map<dynamic, dynamic>? charts;
  List<dynamic> expenses;
  OurGroup(
      {required this.id,
      required this.name,
      required this.creater,
      required this.members,
      required this.groupCreated,
      required this.type,
      required this.expenses,
      required this.simplifyDebt});
}
