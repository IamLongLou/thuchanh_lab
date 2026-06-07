import 'package:flutter/material.dart';
import '../models/chapter.dart';
import '../data/sample_data.dart';

/// Màn hình hiển thị nội dung đọc của một chương sách
class ReadingScreen extends StatefulWidget {
  final String bookId;
  final Chapter chapter;

  const ReadingScreen({super.key, required this.bookId, required this.chapter});

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  late String bookmarkKey;

  @override
  void initState() {
    super.initState();
    // Tạo khóa duy nhất cho chương này để lưu bookmark
    bookmarkKey = "${widget.bookId}-${widget.chapter.title}";
  }

  /// Hàm xử lý thêm hoặc xóa bookmark
  void _toggleBookmark() {
    setState(() {
      if (bookmarks.contains(bookmarkKey)) {
        bookmarks.remove(bookmarkKey);
      } else {
        bookmarks.add(bookmarkKey);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isBookmarked = bookmarks.contains(bookmarkKey);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chapter.title),
        actions: [
          // Nút bấm để thực hiện Bookmark trên thanh công cụ
          IconButton(
            icon: Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_border),
            color: isBookmarked ? Colors.orange : null,
            onPressed: _toggleBookmark,
          ),
        ],
      ),
      // Toàn bộ nội dung sách nằm trong SingleChildScrollView để có thể cuộn
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Text(
          // Nhân bản nội dung văn bản để mô phỏng một chương dài
          widget.chapter.content * 50,
          style: const TextStyle(
            fontSize: 18, 
            height: 1.5, // Độ giãn dòng cho dễ đọc
          ),
        ),
      ),
    );
  }
}
