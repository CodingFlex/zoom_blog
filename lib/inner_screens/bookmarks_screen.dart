import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_flutter_course/widgets/empty_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../services/utils.dart';
import '../widgets/articles_widget.dart';
import 'search_screen.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).getColor;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: color),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Bookmarks',
          style: GoogleFonts.lobster(
              textStyle:
                  TextStyle(fontSize: 20, letterSpacing: 0.6, color: color)),
        ),
        centerTitle: true,
      ),
      body: const EmptyNewsWidget(
        text: 'No bookmarks yet',
        imagePath: 'assets/images/bookmark.png',
      ),
      // ListView.builder(
      //     itemCount: 20,
      //     itemBuilder: (context, index) {
      //       return ArticlesWidget();
      //     }),
    );
  }
}
