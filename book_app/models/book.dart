import 'chapter.dart';

/// Lớp đại diện cho một cuốn sách (Model)
class Book {
  final String id;              // Mã định danh duy nhất của sách
  final String title;           // Tên sách
  final String author;          // Tác giả
  final String coverUrl;        // Đường dẫn ảnh bìa
  final List<Chapter> chapters; // Danh sách các chương thuộc cuốn sách này

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.chapters,
  });
}
