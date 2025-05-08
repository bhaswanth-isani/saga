import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saga/api/api.dart';
import 'package:saga/core/database.dart';
import 'package:saga/helpers/duration.dart';
import 'package:saga/home/viewmodels/user_books.dart';

part 'upload_book.g.dart';

@riverpod
Future<bool> uploadBook(
  Ref ref, {
  required String isbn13,
  required String path,
  required void Function(int, int) progress,
}) async {
  final file = File(path);

  final dio = ref.read(dioClientProvider);
  final contentLength = file.lengthSync();

  final url = await SagaApi(
    dio,
  ).uploadBook(UploadBookRequest(length: contentLength, isbn13: isbn13));

  final options = Options(
    headers: {'Content-Type': 'application/octet-stream', 'Content-Length': contentLength},
  );

  await Dio().put<void>(url, data: file.openRead(), options: options, onSendProgress: progress);

  bool uploaded = false;

  while (!uploaded) {
    final books = await ref.refresh(fetchLibraryProvider.future);
    uploaded = books.any((b) => b.book!.isbn13 == isbn13 && b.book!.path != null);

    if (!uploaded) await Future.delayed(1.seconds);
  }

  return true;
}
