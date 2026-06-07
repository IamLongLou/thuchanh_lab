import '../models/book.dart';
import '../models/chapter.dart';

/// Dữ liệu mẫu giả lập cho ứng dụng (Mock Data)
final List<Book> myLibrary = [
  Book(
    id: '1',
    title: 'Lược Sử Thời Gian',
    author: 'Stephen Hawking',
    coverUrl: 'https://picsum.photos/seed/book1/200/300',
    chapters: [
      Chapter(title: 'Chương 1: Bức tranh về Vũ trụ', content: 'Nội dung chương 1: Con người luôn tò mò về thế giới xung quanh...'),
      Chapter(title: 'Chương 2: Không gian và Thời gian', content: 'Nội dung chương 2: Lý thuyết của Newton và Einstein...'),
    ],
  ),
  Book(
    id: '2',
    title: 'Đắc Nhân Tâm',
    author: 'Dale Carnegie',
    coverUrl: 'https://picsum.photos/seed/book2/200/300',
    chapters: [
      Chapter(title: 'Chương 1: Muốn lấy mật đừng phá tổ ong', content: 'Nội dung chương 1: Đừng chỉ trích người khác...'),
      Chapter(title: 'Chương 2: Bí mật lớn nhất trong giao tiếp', content: 'Nội dung chương 2: Hãy khen ngợi người khác một cách chân thành...'),
    ],
  ),
];

/// Bộ nhớ tạm lưu trữ các Bookmark dưới dạng tập hợp (Set) để tránh trùng lặp
/// Cấu trúc khóa: "bookId-chapterTitle"
Set<String> bookmarks = {};
