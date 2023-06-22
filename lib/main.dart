import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
//pages
import 'pages/listar.dart';
import 'package:crud_firebase/pages/agregar_producto.dart';
import 'package:crud_firebase/pages/editar_producto.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crud Firebase Flutter',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/add': (context) => const AgregarProducto(),
        '/edit': (context) => const EditarProducto(),
      },
    );
  }
}

