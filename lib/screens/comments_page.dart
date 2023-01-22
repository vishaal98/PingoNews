import 'package:flutter/material.dart';
import 'package:pingo_news/providers/comments_provider.dart';
import 'package:provider/provider.dart';

import '../models/comments_model.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({Key? key}) : super(key: key);

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<CommentsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0c54be),
        automaticallyImplyLeading: false,
        title: const Text('Comments'),
      ),
      body: FutureBuilder<List<Comments>?>(
          future: prov.fetchComments(),
          builder: (context, commentSnapshot) {
            if (commentSnapshot.hasData && commentSnapshot.data != null) {
              List<Comments> data = commentSnapshot.data!;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  // var currentComment = prov.commentsList?[index];
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
                                          data[index].name,
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
                                          data[index].email,
                                          style: const TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 15,
                                            color: Color(0xff303f60),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: Text(
                                      data[index].body,
                                      style: const TextStyle(
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
              );
            } else {
              return const Center(
                child: Text("No Data"),
              );
            }
          }),
    );
  }
}
