import 'package:flutter/material.dart';
import '../data/sample_data.dart';
import 'table_of_contents_screen.dart';

/// Màn hình chính hiển thị danh sách tất cả các sách trong thư viện
class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thư viện của tôi')),
      // Sử dụng GridView để hiển thị sách theo dạng lưới 2 cột
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,          // Số lượng cột
          childAspectRatio: 0.7,      // Tỷ lệ khung hình của mỗi ô
          crossAxisSpacing: 16,       // Khoảng cách ngang giữa các ô
          mainAxisSpacing: 16,        // Khoảng cách dọc giữa các ô
        ),
        itemCount: myLibrary.length,
        itemBuilder: (context, index) {
          final book = myLibrary[index];
          return GestureDetector(
            // Chuyển hướng sang màn hình mục lục khi chạm vào sách
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TableOfContentsScreen(book: book),
              ),
            ),
            child: Card(
              child: Column(
                children: [
                  // Hiển thị ảnh bìa sách
                  Expanded(
                    child: Image.network(book.coverUrl, fit: BoxFit.cover),
                  ),
                  // Hiển thị tiêu đề sách
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      book.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
