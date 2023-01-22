import 'package:flutter/material.dart';
import 'package:pingo_news/providers/comments_provider.dart';
import 'package:pingo_news/screens/login_page.dart';
import 'package:provider/provider.dart';

void main() {
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
      ],
      child: const MaterialApp(
        home: LoginPage(),
      ),
    );
  }
}
