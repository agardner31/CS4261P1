import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference decisionCollection = Firestore.instance.collection('decision');
  final String uid;
  DatabaseService({required this.uid});

  Future updateUserData(List<bool> decision) async {
    return await decisionCollection.document(uid).setData({
      'decision': decision,
    });
  }
}