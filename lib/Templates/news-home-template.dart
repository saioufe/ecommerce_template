import 'package:ecommerce_template/models/News.dart';
import 'package:ecommerce_template/providers/allProviders.dart';
import 'package:ecommerce_template/screens/posts-pressed-screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostsHomeTemplate extends StatefulWidget {
  final News news;
  PostsHomeTemplate({this.news});

  @override
  _PostsHomeTemplateState createState() => _PostsHomeTemplateState();
}

class _PostsHomeTemplateState extends State<PostsHomeTemplate> {
  @override
  Widget build(BuildContext context) {
    final allPro = Provider.of<AllProviders>(context);

    return InkWell(
      onTap: () {
        setState(() {
          allPro.NavBarShow(false);
        });
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    PostPressedScreen(postData: widget.news)));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Flexible(
              child: Text(
                widget.news.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.rtl,
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Hero(
                tag: widget.news.id,
                child: Image.asset(
                  "assets/images/${widget.news.image}",
                  width: 100,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
