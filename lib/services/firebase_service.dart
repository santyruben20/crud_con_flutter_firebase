import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getUsuarios() async {
  List usuarios = [];
  QuerySnapshot querysnapshot = await db.collection("productos").get();
  for (var doc in querysnapshot.docs) {
    final Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
    Map person = {
      "nombre": data['nombre'],
      "uid": doc.id,
    };
    
    usuarios.add(person);
  }
  return usuarios;
}

//guardar un nombre en base de datos
Future<void> addUsuarios(String name) async {
  await db.collection("productos").add({"nombre": name});
}

//Actualizar un nombre en base de datos
Future<void> updateUsuarios(String uid, String name) async {
  await db.collection("productos").doc(uid).set({"nombre": name});
}

//Borrar datos de la firebase.
Future<void> deleteUsuarios(String uid) async {
  await db.collection("productos").doc(uid).delete();
}