import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStorDB {
  Future<void> insertDocument(
      Map<String, dynamic> data, String collection) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final collectionRef = firestore.collection(collection);

    try {
      // await Future.delayed(Duration(seconds: 3));
      await collectionRef.add(data).then((value) {
        value.update({'id': value.id});
      });
      print('Document inserted successfully!');
    } on FirebaseException catch (e) {
      print('Error inserting document: ${e.message}');
      throw Exception("Server Exeption");
    }
  }

  Future<Map<String, dynamic>?> getSpecificDocument(
      String collection, String? id) async {
    return FirebaseFirestore.instance
        .collection(collection)
        .doc(id)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document exists on the database');
      }
      return documentSnapshot.data() as Map<String, dynamic>?;
    });
  }

  Future<List<Map<String, dynamic>>> getListDocuments(String collection) async {
    return FirebaseFirestore.instance
        .collection(collection)
        .get()
        .then((QuerySnapshot<Map<String, dynamic>> value) {
      List<Map<String, dynamic>> listDocs = [];
      for (var element in value.docs) {
        listDocs.add(element.data());
      }
      return listDocs;
    });
  }

  Future<List<Map<String, dynamic>>> getFiltredDocuments({
    required String collection,
    required String field,
    required dynamic condition,
    String? field2,
    dynamic condition2,
    String? field3,
    dynamic condition3,
    String? field4,
    dynamic condition4,
  }) async {
    if (field2 == null) {
      print("collection $collection field $field condition $condition");
      return FirebaseFirestore.instance
          .collection(collection)
          .where(field, isEqualTo: condition)
          .get()
          .then((QuerySnapshot<Map<String, dynamic>> value) {
        List<Map<String, dynamic>> listDocs = [];
        for (var element in value.docs) {
          print(element.data());

          listDocs.add(element.data());
        }
        return listDocs;
      });
    } else if (field3 == null) {
      print("collection $collection field $field condition $condition");
      print("collection $collection field $field2 condition $condition2");
      return FirebaseFirestore.instance
          .collection(collection)
          .where(field, isEqualTo: condition)
          .where(field2, isEqualTo: condition2)
          .get()
          .then((QuerySnapshot<Map<String, dynamic>> value) {
        List<Map<String, dynamic>> listDocs = [];
        for (var element in value.docs) {
          print(element.data());

          listDocs.add(element.data());
        }
        return listDocs;
      });
    } else if (field4 == null) {
      print("collection $collection field $field condition $condition");
      print("collection $collection field $field2 condition $condition2");
      print("collection $collection field $field3 condition $condition3");
      return FirebaseFirestore.instance
          .collection(collection)
          .where(field, isEqualTo: condition)
          .where(field2, isEqualTo: condition2)
          .where(field3, isEqualTo: condition3)
          .get()
          .then((QuerySnapshot<Map<String, dynamic>> value) {
        List<Map<String, dynamic>> listDocs = [];
        for (var element in value.docs) {
          print(element.data());

          listDocs.add(element.data());
        }
        return listDocs;
      });
    } else {
      print("collection $collection field $field condition $condition");
      print("collection $collection field $field2 condition $condition2");
      print("collection $collection field $field3 condition $condition3");
      print("collection $collection field $field4 condition $condition4");
      return FirebaseFirestore.instance
          .collection(collection)
          .where(field, isEqualTo: condition)
          .where(field2, isEqualTo: condition2)
          .where(field3, isEqualTo: condition3)
          .where(field4, isEqualTo: condition4)
          .get()
          .then((QuerySnapshot<Map<String, dynamic>> value) {
        List<Map<String, dynamic>> listDocs = [];
        for (var element in value.docs) {
          print(element.data());

          listDocs.add(element.data());
        }
        return listDocs;
      });
    }
  }

  Future<List<Map<String, dynamic>>> getDocumentsWithListCondition({
    required String collection,
    required String field,
    required dynamic condition,
    String? field2,
    dynamic condition2,
    String? field3,
    dynamic condition3,
    String? field4,
    dynamic condition4,
  }) async {
    if (field2 == null) {
      print("collection $collection field $field condition $condition");
      return FirebaseFirestore.instance
          .collection(collection)
          .where(field, arrayContains: condition)
          .get()
          .then((QuerySnapshot<Map<String, dynamic>> value) {
        List<Map<String, dynamic>> listDocs = [];
        for (var element in value.docs) {
          print(element.data());

          listDocs.add(element.data());
        }
        return listDocs;
      });
    } else if (field3 == null) {
      print("collection $collection field $field condition $condition");
      print("collection $collection field $field2 condition $condition2");
      return FirebaseFirestore.instance
          .collection(collection)
          .where(field, arrayContains: condition)
          .where(field2, isEqualTo: condition2)
          .get()
          .then((QuerySnapshot<Map<String, dynamic>> value) {
        List<Map<String, dynamic>> listDocs = [];
        for (var element in value.docs) {
          print(element.data());

          listDocs.add(element.data());
        }
        return listDocs;
      });
    } else if (field4 == null) {
      print("collection $collection field $field condition $condition");
      print("collection $collection field $field2 condition $condition2");
      print("collection $collection field $field3 condition $condition3");
      return FirebaseFirestore.instance
          .collection(collection)
          .where(field, isEqualTo: condition)
          .where(field2, isEqualTo: condition2)
          .where(field3, isEqualTo: condition3)
          .get()
          .then((QuerySnapshot<Map<String, dynamic>> value) {
        List<Map<String, dynamic>> listDocs = [];
        for (var element in value.docs) {
          print(element.data());

          listDocs.add(element.data());
        }
        return listDocs;
      });
    } else {
      print("collection $collection field $field condition $condition");
      print("collection $collection field $field2 condition $condition2");
      print("collection $collection field $field3 condition $condition3");
      print("collection $collection field $field4 condition $condition4");
      return FirebaseFirestore.instance
          .collection(collection)
          .where(field, isEqualTo: condition)
          .where(field2, isEqualTo: condition2)
          .where(field3, isEqualTo: condition3)
          .where(field4, isEqualTo: condition4)
          .get()
          .then((QuerySnapshot<Map<String, dynamic>> value) {
        List<Map<String, dynamic>> listDocs = [];
        for (var element in value.docs) {
          print(element.data());

          listDocs.add(element.data());
        }
        return listDocs;
      });
    }
  }

  Future<List<Map<String, dynamic>>> getFiltredDocumentsWithContain({
    required String collection,
    required String field,
    required dynamic condition,
    String? field2,
    dynamic condition2,
  }) async {
    print("collection $collection field $field condition $condition");
    print("collection $collection field $field2 condition $condition2");
    return FirebaseFirestore.instance
        .collection(collection)
        .where(field, isEqualTo: condition)
        .where(field2!, arrayContains: condition2)
        .get()
        .then((QuerySnapshot<Map<String, dynamic>> value) {
      List<Map<String, dynamic>> listDocs = [];
      for (var element in value.docs) {
        print(element.data());

        listDocs.add(element.data());
      }
      return listDocs;
    });
  }

  Future<void> updateSpecificFields(
      {required String collection,
      required String id,
      required String filed,
      required dynamic value}) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final docRef = firestore.collection(collection).doc(id);

    // Create a map with the fields to update
    Map<String, dynamic> updateData = {filed: value};

    try {
      await docRef.update(updateData);
      print('Document updated successfully!');
    } on FirebaseException catch (e) {
      print('Error updating document: ${e.message}');
      rethrow;
    }
  }

  Future<void> updateDocument({
    required String collection,
    required String id,
    required Map<String, dynamic> map,
  }) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final docRef = firestore.collection(collection).doc(id);

    // Create a map with the fields to update
    Map<String, dynamic> updateData = map;

    try {
      await docRef.update(updateData);
      print('Document updated successfully!');
    } on FirebaseException catch (e) {
      print('Error updating document: ${e.message}');
    }
    Future<void> deleteDocument(
        String collectionPath, String documentId) async {
      try {
        // Get a reference to the document
        final documentReference = FirebaseFirestore.instance
            .collection(collectionPath)
            .doc(documentId);

        // Delete the document
        await documentReference.delete();

        print('Document deleted successfully!');
      } catch (e) {
        print('Error deleting document: $e');
        rethrow;
      }
    }
  }

  Future<void> deleteDocument(String collectionPath, String documentId) async {
    try {
      // Get a reference to the document
      final documentReference =
          FirebaseFirestore.instance.collection(collectionPath).doc(documentId);

      // Delete the document
      await documentReference.delete();

      print('Document deleted successfully!');
    } catch (e) {
      print('Error deleting document: $e');
      rethrow;
    }
  }
}
