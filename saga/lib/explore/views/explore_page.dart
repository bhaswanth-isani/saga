import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:saga/core/routes.dart';
import 'package:saga/explore/models/book.dart';
import 'package:saga/explore/viewmodels/explore_view_model.dart';
import 'package:saga/gen/assets.gen.dart';
import 'package:saga/theme/theme.dart';

class ExplorePage extends HookConsumerWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendingBooks = ref.watch(trendingBooksProvider);

    if (!trendingBooks.hasValue) {
      return const Center(child: CircularProgressIndicator());
    }

    final monthNewBooks = ref.watch(monthNewBooksProvider);

    if (!monthNewBooks.hasValue) {
      return const Center(child: CircularProgressIndicator());
    }

    final yearNewBooks = ref.watch(yearNewBooksProvider);

    if (!yearNewBooks.hasValue) {
      return const Center(child: CircularProgressIndicator());
    }

    final month = useMemoized(() => DateFormat.MMMM().format(DateTime.now()));
    final year = useMemoized(() => DateFormat.y().format(DateTime.now()));

    return SingleChildScrollView(
      padding: Prism.padding.yXL,
      child: Column(
        spacing: Prism.base.xxl,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Books('Trending', trendingBooks.value!),
          Books('$month $year Releases', monthNewBooks.value!),
          Books('$year Releases', yearNewBooks.value!),
        ],
      ),
    );
  }
}

class Books extends StatelessWidget {
  const Books(this.title, this.books, {super.key});

  final String title;
  final List<Book> books;

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
                      (book) => GestureDetector(
                        onTap: () => BookRoute(book.isbn13).push(context),
                        child: Stack(
                          children: [
                            Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(borderRadius: Prism.radius.xs),
                              foregroundDecoration: BoxDecoration(
                                borderRadius: Prism.radius.xs,
                                border: Border.all(color: Prism.colors(context).primary),
                              ),
                              child: Image.network(book.image, height: 220, fit: BoxFit.cover),
                            ),
                            Positioned(
                              bottom: 6,
                              right: 6,
                              child: Container(
                                padding: Prism.padding.xS + Prism.padding.yXS,
                                decoration: BoxDecoration(
                                  color: Prism.colors(context).primary.withValues(alpha: 0.95),
                                  borderRadius: BorderRadius.circular(Prism.base.xxl),
                                ),
                                child: Row(
                                  spacing: Prism.base.xs,
                                  children: [
                                    Assets.icons.library.svg(
                                      height: 14,
                                      colorFilter: ColorFilter.mode(
                                        Prism.colors(context).text.onPrimary,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    Text(
                                      book.readers.toString(),
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
