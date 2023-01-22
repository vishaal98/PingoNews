import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import '../models/comments_model.dart';

class CommentsProvider with ChangeNotifier {
  List<Comments>? commentsList = [];
  Future<List<Comments>?> fetchComments() async {
    try {
      Response response =
          await get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
      if (response.statusCode == 200) {
        List<dynamic> responseBody = jsonDecode(response.body);
        List<Comments> comments = responseBody
            .map(
              (dynamic item) => Comments.fromJson(item),
            )
            .toList();
        return comments;
      } else {
        throw "Unable to retrieve comments.";
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<void> getComments() async {
    commentsList = await fetchComments();
  }
}
