import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pingo_news/providers/comments_provider.dart';
import 'package:pingo_news/providers/login_provider.dart';
import 'package:pingo_news/screens/login_page.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const PingoNews());
}

class PingoNews extends StatefulWidget {
  const PingoNews({Key? key}) : super(key: key);

  @override
  State<PingoNews> createState() => _PingoNewsState();
}

class _PingoNewsState extends State<PingoNews> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CommentsProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
      ],
      child: const MaterialApp(
        home: LoginPage(),
      ),
    );
  }
}
