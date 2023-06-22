import 'package:crud_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

class EditarProducto extends StatefulWidget {
  const EditarProducto({super.key});

  @override
  State<EditarProducto> createState() => _EditarProductoState();
}

class _EditarProductoState extends State<EditarProducto> {
  TextEditingController nameController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    nameController.text = arguments["name"];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Actualizar',
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  await updateUsuarios(arguments['uid'], nameController.text)
                      .then((_) {
                    Navigator.pop(context);
                  });
                },
                child: const Text("Actualizar"))
          ],
        ),
      ),
    );
  }
}
