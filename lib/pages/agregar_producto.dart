import 'package:crud_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

class AgregarProducto extends StatefulWidget {
  const AgregarProducto({super.key});

  @override
  State<AgregarProducto> createState() => _AgregarProductoState();
}

class _AgregarProductoState extends State<AgregarProducto> {
  TextEditingController nameController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nombre'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Nuevo',
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  await addUsuarios(nameController.text).then((_) {
                    Navigator.pop(context);
                  });
                },
                child: const Text("Guardar Producto"))
          ],
        ),
      ),
    );
  }
}
