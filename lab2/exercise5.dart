/**
 * Exercise 5 - Async, Future, Null Safety & Streams
 * Mục tiêu: Thực hành về async/await, Future, toán tử null-safety và Streams.
 */

import 'dart:async';

Future<void> main() async {
  // FUTURE + ASYNC/AWAIT
  print("Loading data...");

  // await để đợi cho đến khi Future hoàn thành
  String data = await fetchDataFromServer();
  print("Data received: $data");

  // -- NULL SAFETY (?, ??, !) --
  // Biến có thể null (Nullable variable)
  String? username;

  // Nếu username null, in ra "Guest" sử dụng toán tử ??
  print("Username: ${username ?? "Guest"}");

  // Gán giá trị
  username = "Đức Duy";

  // Sử dụng ! để khẳng định giá trị không null
  print("Username length: ${username!.length}");

  // -- STREAM --
  print("\nStreaming numbers:");

  Stream<int> numberStream = countStream(5);

  // Lắng nghe giá trị từ stream bằng await for
  await for (int value in numberStream) {
    print("Stream value: $value");
  }

  print("Stream completed.");
}

// Hàm giả lập lấy dữ liệu từ server
Future<String> fetchDataFromServer() {
  return Future.delayed(Duration(seconds: 2), () => "Fake Server Data (Success)");
}

// Stream generator
Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}
