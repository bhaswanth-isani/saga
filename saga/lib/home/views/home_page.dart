import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saga/api/api.dart';
import 'package:saga/core/routes.dart';
import 'package:saga/home/viewmodels/stats.dart';
import 'package:saga/home/viewmodels/user_books.dart';
import 'package:saga/theme/theme.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allUserBooks = ref.watch(libraryProvider);
    final allStats = ref.watch(statsProvider);

    useEffect(() {
      Future(() async {
        await ref.read(fetchLibraryProvider.future);
        await ref.read(fetchStatsProvider.future);
      });
      return null;
    }, []);

    if (!allUserBooks.hasValue || !allStats.hasValue) {
      return const Center(child: CircularProgressIndicator());
    }

    final readingBooks =
        allUserBooks.value!.where((e) => e.book!.progress > 0 && e.book!.progress < 1).toList();
    final completedBooks = allUserBooks.value!.where((e) => e.book!.progress >= 1).toList();

    final monthStats = useMemoized(
      () => allStats.value!.where((s) => s.createdAt.month == DateTime.now().month),
      [allStats],
    );

    final heatMapData = useMemoized(
      () => Map.fromEntries(
        monthStats
            .groupListsBy((s) => DateTime(s.createdAt.year, s.createdAt.month, s.createdAt.day))
            .entries
            .map(
              (s) => MapEntry(
                s.key,
                s.value.fold(
                  0,
                  (value, s) =>
                      value +
                      (allUserBooks.value!.firstWhere((b) => b.book!.id == s.bookId).details.pages *
                              s.progress)
                          .round(),
                ),
              ),
            ),
      ),
      [monthStats, allUserBooks],
    );

    return SingleChildScrollView(
      padding: Prism.padding.yXL,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Prism.base.xxl,
        children: [
          if (readingBooks.isNotEmpty) UserBooks('Continue Reading', readingBooks),
          Padding(
            padding: Prism.padding.xXL,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: Prism.base.m,
              children: [
                Text('Stats', style: Prism.text(context).titleSmall),
                Container(
                  padding: Prism.padding.m,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Prism.colors(context).widget.hover,
                    borderRadius: Prism.radius.s,
                  ),
                  child: HeatMap(
                    startDate: DateTime(DateTime.now().year, DateTime.now().month - 1),
                    endDate: DateTime(DateTime.now().year, 12, 31),
                    datasets: heatMapData,
                    colorsets: {12: Color(0xFF56D364), 8: Color(0xFF2DA042), 4: Color(0xFF196C2E)},
                    defaultColor: Prism.colors(context).widget.active,
                    showColorTip: false,
                    textColor: Prism.colors(context).text.secondary,
                    scrollable: true,
                  ),
                ),
              ],
            ),
          ),
          if (completedBooks.isNotEmpty) UserBooks('Completed in 2025', completedBooks),
        ],
      ),
    );
  }
}

class UserBooks extends StatelessWidget {
  const UserBooks(this.title, this.books, {super.key});

  final String title;
  final List<UserBookDetails> books;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Prism.base.m,
      children: [
        Padding(
          padding: Prism.padding.xXL,
          child: Text(title, style: Prism.text(context).titleSmall),
        ),
        SingleChildScrollView(
          padding: Prism.padding.xXL,
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: Prism.base.l,
            children:
                books
                    .map(
                      (bookDetails) => GestureDetector(
                        onTap: () => BookRoute(bookDetails.book!.isbn13).push(context),
                        child: Stack(
                          children: [
                            Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(borderRadius: Prism.radius.xs),
                              foregroundDecoration: BoxDecoration(
                                borderRadius: Prism.radius.xs,
                                border: Border.all(color: Prism.colors(context).primary),
                              ),
                              child: Image.network(
                                bookDetails.details.image,
                                height: 220,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 6,
                              right: 6,
                              child: Container(
                                padding: Prism.padding.rXS + Prism.padding.xs,
                                decoration: BoxDecoration(
                                  color: Prism.colors(context).primary.withValues(alpha: 0.95),
                                  borderRadius: BorderRadius.circular(Prism.base.xxl),
                                ),
                                child: Row(
                                  spacing: Prism.base.s,
                                  children: [
                                    SizedBox.square(
                                      dimension: 14,
                                      child: CircularProgressIndicator(
                                        value: bookDetails.book!.progress,
                                        color: Prism.colors(context).text.onPrimary,
                                        backgroundColor: Prism.colors(context).text.secondary,
                                        strokeWidth: 2,
                                      ),
                                    ),
                                    Text(
                                      '${(bookDetails.book!.progress * 100).round()}%',
                                      style: Prism.text(context).labelExtraSmall.copyWith(
                                        color: Prism.colors(context).text.onPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
          ),
        ),
      ],
    );
  }
}
