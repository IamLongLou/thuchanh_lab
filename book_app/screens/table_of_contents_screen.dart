import 'package:flutter/material.dart';
import '../models/book.dart';
import '../data/sample_data.dart';
import 'reading_screen.dart';

/// Màn hình hiển thị danh sách các chương của một cuốn sách cụ thể
class TableOfContentsScreen extends StatelessWidget {
  final Book book;
  const TableOfContentsScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: ListView.builder(
        itemCount: book.chapters.length,
        itemBuilder: (context, index) {
          final chapter = book.chapters[index];
          // Khóa để xác định xem chương này đã được bookmark hay chưa
          final bookmarkKey = "${book.id}-${chapter.title}";

          return ListTile(
            leading: const Icon(Icons.menu_book),
            title: Text(chapter.title),
            // Hiển thị biểu tượng bookmark nếu chương này có trong danh sách đánh dấu
            trailing: bookmarks.contains(bookmarkKey)
                ? const Icon(Icons.bookmark, color: Colors.orange)
                : null,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ReadingScreen(bookId: book.id, chapter: chapter),
              ),
            ).then((_) {
              // Khi quay lại từ màn hình đọc, bắt buộc UI vẽ lại để cập nhật trạng thái bookmark mới nhất
              (context as Element).markNeedsBuild();
            }),
          );
        },
      ),
    );
  }
}
