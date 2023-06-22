import 'package:crud_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: FutureBuilder(
          future: getUsuarios(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      onDismissed: (direccion) async {
                        await deleteUsuarios(snapshot.data?[index]['uid']);
                        snapshot.data?.removeAt(index);
                      },
                      confirmDismiss: (direccion) async {
                        bool result = false;
                        result = await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                    "¿Esta Seguro de eliminar a ${snapshot.data?[index]['name']}?"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        return Navigator.pop(
                                          context,
                                          false,
                                        );
                                      },
                                      child: const Text("CANCELAR",
                                          style: TextStyle(color: Colors.red))),
                                  TextButton(
                                      onPressed: () {
                                        return Navigator.pop(
                                          context,
                                          true,
                                        );
                                      },
                                      child: const Text("SI, ESTOY SEGURO"))
                                ],
                              );
                            });

                        return result;
                      },
                      background: Container(
                        color: Colors.red,
                        child: const Icon(Icons.delete),
                      ),
                      direction: DismissDirection.startToEnd,
                      key: Key(snapshot.data?[index]['uid']),
                      child: ListTile(
                          title: Text(snapshot.data?[index]['name']),
                          onTap: (() async {
                            await Navigator.pushNamed(context, '/edit',
                                arguments: {
                                  "name": snapshot.data?[index]['name'],
                                  "uid": snapshot.data?[index]['uid'],
                                });
                            setState(() {});
                          })),
                    );
                  });
            } else {
              return const Center(
                child: Text("CARGANDO DATA..."),
              );
            }
          })),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.pushNamed(context, '/add');
            setState(() {});
          },
          child: const Icon(Icons.add)),
    );
  }
}
