import 'package:collection/collection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:saga/core/routes.dart';
import 'package:saga/core/viewmodels/get_book.dart';
import 'package:saga/core/viewmodels/upload_book.dart';
import 'package:saga/gen/assets.gen.dart';
import 'package:saga/theme/theme.dart';

class BookPage extends HookConsumerWidget {
  const BookPage(this.isbn13, {super.key});

  final String isbn13;

  Widget _bookDetails(BuildContext context, String label, String value) {
    return Padding(
      padding: Prism.padding.xM,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Prism.text(
              context,
            ).bodyExtraSmall.copyWith(color: Prism.colors(context).text.secondary),
          ),
          Text(value, style: Prism.text(context).labelMedium),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookData = ref.watch(getBookDetailsProvider(isbn13));

    if (!bookData.hasValue) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final details = bookData.value?.details;
    final book = bookData.value?.book;

    useEffect(() {
      Future(() {
        if (details == null && context.mounted) context.pop();
      });
      return null;
    }, [details]);

    if (details == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: FutureBuilder(
        future: details.mainColor,
        builder: (context, snapshot) {
          final mainColor = snapshot.data;

          if (snapshot.hasData) {
            final colors = mainColor!.isLight() ? Prism.darkTheme : Prism.lightTheme;

            return HookBuilder(
              builder: (context) {
                useEffect(() {
                  SystemChrome.setSystemUIOverlayStyle(
                    SystemUiOverlayStyle(
                      statusBarColor: Colors.transparent, // Make status bar transparent
                      statusBarIconBrightness:
                          !mainColor.isLight() ? Brightness.dark : Brightness.light, // For Android
                      statusBarBrightness:
                          !mainColor.isLight() ? Brightness.light : Brightness.dark, // For iOS
                    ),
                  );
                  return null;
                }, [mainColor]);

                final uploadProgress = useState<double?>(null);

                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: 300,
                              width: double.infinity,
                              color: mainColor,
                              child: SafeArea(
                                bottom: false,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      top: 24,
                                      left: 24,
                                      child: GestureDetector(
                                        onTap: () => context.pop(),
                                        child: Container(
                                          padding: const EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                            color: colors.primary,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            FontAwesomeIcons.chevronLeft,
                                            color: colors.text.onPrimary,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: -120,
                                      left: 0,
                                      right: 0,
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Hero(
                                          tag: isbn13,
                                          child: Container(
                                            clipBehavior: Clip.antiAliasWithSaveLayer,
                                            decoration: BoxDecoration(
                                              borderRadius: Prism.radius.xs,
                                            ),
                                            foregroundDecoration: BoxDecoration(
                                              borderRadius: Prism.radius.xs,
                                              border: Border.all(color: colors.primary),
                                            ),
                                            child: Image.network(
                                              details.image,
                                              height: 300,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 120),
                            Padding(
                              padding: Prism.padding.xXL,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Prism.spacing.yM,
                                  Text(
                                    details.title,
                                    style: Prism.text(context).titleSmall.copyWith(height: 1.2),
                                  ),
                                  Text(
                                    'By ${details.authors[0].name}',
                                    style: Prism.text(context).bodySmall,
                                  ),
                                  Prism.spacing.yXL,
                                  Divider(),
                                  Container(
                                    padding: Prism.padding.yS,
                                    height: 56,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: _bookDetails(
                                            context,
                                            'Pages',
                                            details.pages.toString(),
                                          ),
                                        ),
                                        const VerticalDivider(),
                                        Expanded(
                                          child: _bookDetails(
                                            context,
                                            'Release',
                                            details.releaseDate.year.toString(),
                                          ),
                                        ),
                                        const VerticalDivider(),
                                        Expanded(
                                          child: _bookDetails(
                                            context,
                                            'Readers',
                                            details.readers.toString(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(),
                                ],
                              ),
                            ),
                            Padding(
                              padding: Prism.padding.xXL + Prism.padding.yL,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Description',
                                    style: Prism.text(context).bodyExtraSmall.copyWith(
                                      color: Prism.colors(context).text.secondary,
                                    ),
                                  ),
                                  Prism.spacing.yS,
                                  Text(details.description, style: Prism.text(context).bodySmall),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (book == null) {
                          final result = await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['epub'],
                          );

                          final filePath = result?.files.firstOrNull?.path;

                          if (filePath != null) {
                            uploadProgress.value = 0;
                            await ref.read(
                              uploadBookProvider(
                                isbn13: details.isbn13,
                                path: filePath,
                                progress:
                                    (sentBytes, totalBytes) =>
                                        uploadProgress.value = sentBytes / totalBytes,
                              ).selectAsync((v) => v),
                            );
                            uploadProgress.value == null;
                          }
                        } else {
                          ReaderRoute(isbn13).push(context);
                        }
                      },
                      child: Container(
                        height: 80,
                        color: Prism.colors(context).primary,
                        child: SafeArea(
                          top: false,
                          child: Center(
                            child:
                                book != null
                                    ? Row(
                                      mainAxisSize: MainAxisSize.min,
                                      spacing: Prism.base.m,
                                      children: [
                                        Assets.icons.library.svg(
                                          colorFilter: ColorFilter.mode(
                                            Prism.colors(context).text.onPrimary,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                        Text(
                                          'Read',
                                          style: GoogleFonts.poppins(
                                            color: Prism.colors(context).text.onPrimary,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    )
                                    : uploadProgress.value == null
                                    ? Row(
                                      mainAxisSize: MainAxisSize.min,
                                      spacing: Prism.base.m,
                                      children: [
                                        Icon(
                                          HugeIcons.strokeRoundedUpload02,
                                          color: Prism.colors(context).text.onPrimary,
                                        ),
                                        Text(
                                          'Upload',
                                          style: GoogleFonts.poppins(
                                            color: Prism.colors(context).text.onPrimary,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    )
                                    : Row(
                                      mainAxisSize: MainAxisSize.min,
                                      spacing: Prism.base.m,
                                      children: [
                                        SizedBox.square(
                                          dimension: 20,
                                          child: CircularProgressIndicator(
                                            value: uploadProgress.value,
                                            color: Prism.colors(context).text.onPrimary,
                                            backgroundColor: Prism.colors(context).text.secondary,
                                            strokeWidth: 2.5,
                                          ),
                                        ),
                                        Text(
                                          'Uploading...',
                                          style: GoogleFonts.poppins(
                                            color: Prism.colors(context).text.onPrimary,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

extension on Color {
  bool isLight() {
    return computeLuminance() < 0.5;
  }
}
