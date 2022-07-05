import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'user_group_model.dart';

class DataBases {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> createUser(OurUser user) async {
    try {
      await _firestore.collection("users").doc(user.email).set({
        "uid": user.uid,
        "fullName": user.name,
        "email": user.email,
        "accountCreated": Timestamp.now(),
        "groups": user.groups,
        "friends": user.friends,
        "activity": user.activity,
        "Expenses": user.expenses
      });
      return "success";
    } catch (e) {
      return e.toString();
    }
  }

  Future<OurUser> getInfo(String email) async {
    OurUser ret = OurUser(
        uid: '',
        email: email,
        name: '',
        accountCreated: Timestamp.now(),
        groups: [],
        friends: [],
        activity: [],
        expenses: []);
    try {
      DocumentSnapshot _doc =
          await _firestore.collection("users").doc(email).get();
      ret.name = _doc.get("fullName");
      ret.email = _doc.get("email");
      ret.accountCreated = _doc.get("accountCreated");
      ret.groups = _doc.get("groups");
      ret.friends = _doc.get("friends");
      ret.activity = _doc.get("activity");
      ret.expenses = _doc.get("Expenses");
    } catch (e) {
      return ret;
    }
    return ret;
  }

  Future<OurGroup> groupInfo(String uid) async {
    OurGroup ret = OurGroup(
        id: uid,
        name: '',
        creater: '',
        members: [],
        groupCreated: Timestamp.now(),
        type: '',
        expenses: [],
        simplifyDebt: false);
    try {
      DocumentSnapshot _doc =
          await _firestore.collection("group").doc(uid).get();
      ret.name = _doc.get("groupName");
      ret.expenses = _doc.get("expenses");
      ret.type = _doc.get("type");
      ret.groupCreated = _doc.get("groupCreated");
      ret.simplifyDebt = _doc.get("simplify");
      ret.creater = _doc.get("created");
      ret.members = _doc.get("members");
    } catch (e) {
      return ret;
    }
    return ret;
  }

  Future<String> groupCreate(
      String groupName, String type, bool simplify) async {
    String ret = "error";
    List<dynamic> members = [];

    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) return ret;
      String? email = currentUser.email;
      members.add({"email": email, "totalShare": 0, "totalPaid": 0});
      DocumentReference _docRef = await _firestore.collection("group").add({
        "groupID": "0",
        "groupName": groupName,
        "type": type,
        "created": email,
        "simplify": simplify,
        "members": members,
        "groupCreated": Timestamp.now(),
        "expenses": [],
      });
      OurUser userData = await getInfo(email!);
      var data = userData.groups;
      List<dynamic> groups = [];
      groups = data;
      groups.add(_docRef.id);
      await _firestore
          .collection("users")
          .doc(email)
          .update({"groups": groups});
      await _firestore
          .collection("group")
          .doc(_docRef.id)
          .update({"groupID": _docRef.id});
      return "success";
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> addPersonalExpenses(
      String description, String amount, Timestamp date) async {
    String ret = "error";
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) return ret;
      String? email = currentUser.email;
      DocumentSnapshot _doc =
          await _firestore.collection("users").doc(email).get();
      List<dynamic> data = _doc.get("Expenses");
      Map<dynamic, dynamic> temp = {
        "description": description,
        "amount": int.parse(amount),
        "dateAdded": Timestamp.now(),
        "dateSpent": date
      };
      data.add(temp);
      await _firestore
          .collection("users")
          .doc(email)
          .update({"Expenses": data});
      return "success";
    } catch (e) {
      return ret;
    }
  }

  Future<String> addGroupExpenses(
      String description,
      String amount,
      Timestamp date,
      String groupId,
      List<dynamic> whoPaid,
      List<dynamic> distributeAmong) async {
    String ret = "error";
    try {
      DocumentSnapshot _doc =
          await _firestore.collection("group").doc(groupId).get();
      List<dynamic> data = _doc.get("expenses");
      Map<dynamic, dynamic> temp = {
        "description": description,
        "amount": int.parse(amount),
        "whoPaid": whoPaid,
        "whenPaid": date,
        "whenCreated": Timestamp.now(),
        "memberShare": distributeAmong
      };
      data.add(temp);
      await _firestore
          .collection("user")
          .doc(groupId)
          .update({"expenses": data});
      return "success";
    } catch (e) {
      return ret;
    }
  }

  Future<String> addFriend(List<String> emails, String userEmail) async {
    String ret = "error";
    try {
      DocumentSnapshot _doc =
          await _firestore.collection("users").doc(userEmail).get();
      List<dynamic> friends = _doc.get("friends");
      for (int i = 0; i < emails.length; i++) {
        OurUser user = await getInfo(emails[i]);
        Map<dynamic, dynamic> temp = {
          "FriendName": user.name,
          "friendEmail": emails[i],
        };
        friends.add(temp);
      }
      friends.toSet().toList();
      await _firestore
          .collection("users")
          .doc(userEmail)
          .update({"friends": friends});
      return "success";
    } catch (e) {
      return ret;
    }
  }

  Future<String> addPeopleToGroup(List<String> emails, String uid) async {
    String ret = "Try adding friends again";
    try {
      DocumentSnapshot _doc =
          await _firestore.collection("group").doc(uid).get();
      List<dynamic> data = _doc.get("members");
      for (int i = 0; i < emails.length; i++) {
        OurUser userData = await getInfo(emails[i]);
        if (userData.name != '') {
          userData.groups.add(uid);
          data.add({"totalPaid": 0, "totalShare": 0, "email": emails[i]});
        }
      }
      await _firestore.collection("group").doc(uid).update({"members": data});
      return "Success";
    } catch (e) {
      return ret;
    }
  }
}
