import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saga/api/api.dart';
import 'package:saga/home/viewmodels/user_books.dart';
import 'package:saga/home/views/home_page.dart';
import 'package:saga/theme/theme.dart';

class LibraryPage extends ConsumerWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<UserBookDetails>> tbrBooks = ref.watch(
      libraryProvider.select(
        (value) => switch (value) {
          AsyncData(:final value) => AsyncData(value.where((b) => b.book!.progress == 0).toList()),
          _ => value,
        },
      ),
    );
    final AsyncValue<List<UserBookDetails>> readingBooks = ref.watch(
      libraryProvider.select(
        (value) => switch (value) {
          AsyncData(:final value) => AsyncData(
            value.where((b) => b.book!.progress > 0 && b.book!.progress < 1).toList(),
          ),
          _ => value,
        },
      ),
    );
    final AsyncValue<List<UserBookDetails>> completedBooks = ref.watch(
      libraryProvider.select(
        (value) => switch (value) {
          AsyncData(:final value) => AsyncData(value.where((b) => b.book!.progress == 1).toList()),
          _ => value,
        },
      ),
    );

    if (!tbrBooks.hasValue || !readingBooks.hasValue || !completedBooks.hasValue) {
      return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      padding: Prism.padding.yXL,
      child: Column(
        spacing: Prism.base.xxl,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (readingBooks.value!.isNotEmpty) UserBooks('Continue Reading', readingBooks.value!),
          if (tbrBooks.value!.isNotEmpty) UserBooks('Want to Read', tbrBooks.value!),
          if (completedBooks.value!.isNotEmpty) UserBooks('Completed', completedBooks.value!),
        ],
      ),
    );
  }
}
