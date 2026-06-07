import 'package:flutter/material.dart';
import 'screens/library_screen.dart';

/// Điểm bắt đầu của ứng dụng đọc sách
void main() => runApp(const BookReaderApp());

class BookReaderApp extends StatelessWidget {
  const BookReaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Reader',
      debugShowCheckedModeBanner: false, // Ẩn biểu tượng debug
      theme: ThemeData(
        primarySwatch: Colors.brown, // Màu chủ đạo tông màu nâu (phù hợp với đọc sách)
        useMaterial3: true,
      ),
      // Đặt màn hình thư viện là màn hình khởi đầu
      home: const LibraryScreen(),
    );
  }
}
