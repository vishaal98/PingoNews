import 'package:flutter/material.dart';
import 'package:pingo_news/providers/comments_provider.dart';
import 'package:provider/provider.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({Key? key}) : super(key: key);

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CommentsProvider>(builder: (context, prov, _) {
      prov.getComments();
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff0c54be),
          automaticallyImplyLeading: false,
          title: const Text('Comments'),
        ),
        body: ListView.builder(
          itemCount: prov.commentsList?.length,
          itemBuilder: (context, index) {
            var currentComment = prov.commentsList?[index];
            return Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    debugPrint('Card tapped.');
                  },
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color(0xffced3dc),
                        foregroundColor: Color(0xff303f60),
                        radius: 30,
                        child: Text(
                          "A",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30.0,
                      ),
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Expanded(
                                  child: Text(
                                    "Name: ",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 15,
                                      color: Color(0xffc3d3dc),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    currentComment == null
                                        ? "Value"
                                        : currentComment.name,
                                    style: const TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 15,
                                      color: Color(0xff303f60),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Expanded(
                                  child: Text(
                                    "Email: ",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 15,
                                      color: Color(0xffc3d3dc),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    currentComment == null
                                        ? "Value"
                                        : currentComment.email,
                                    style: const TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 15,
                                      color: Color(0xff303f60),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 300,
                              child: Text(
                                "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, type specimen book. It has survived not only five centuries,",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 15,
                                  color: Color(0xff303f60),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            );
          },
        ),
      );
    });
  }
}
