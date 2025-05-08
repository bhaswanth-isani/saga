import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saga/core/viewmodels/get_book.dart';
import 'package:saga/helpers/epub_controller.dart';
import 'package:saga/reader/models/chapter.dart';
import 'package:saga/reader/models/data_loader.dart';
import 'package:saga/reader/views/components/epub_viewer.dart';
import 'package:saga/reader/views/viewmodels/set_stat.dart';
import 'package:saga/theme/theme.dart';

class ReaderPage extends HookConsumerWidget {
  const ReaderPage(this.isbn13, {super.key});

  final String isbn13;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookData = ref.watch(getBookDetailsProvider(isbn13));
    final bookController = useMemoized(() => EpubController(), []);
    final progress = useState(0.0);

    useEffect(() {
      if (bookData.hasValue && bookData.value?.book?.path == null) {
        Future(() {
          if (context.mounted) context.pop();
        });
      }
      return null;
    }, [bookData]);

    if (bookData.valueOrNull?.book?.path == null) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: Prism.lightTheme.background,
      appBar: AppBar(
        title: Text(
          bookData.value!.details.title,
          style: GoogleFonts.kanit(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Prism.lightTheme.text.primary,
          ),
        ),
        iconTheme: IconThemeData(color: Prism.lightTheme.text.primary),
        backgroundColor: EpubTheme.light().background,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            EpubViewer(
              epubSource: EpubSource.fromNetwork(bookData.value!.book!.path!),
              epubController: bookController,
              displaySettings: EpubDisplaySettings(theme: EpubTheme.light()),
              onRelocated: (value) async {
                progress.value = value.progress;
                final uProgress = progress.value - bookData.value!.book!.progress;

                if (uProgress > 0) {
                  ref.read(setStatProvider(isbn13: isbn13, progress: uProgress).future);
                }
              },
            ),
            GestureDetector(
              onDoubleTap: () => bookController.nextPage(),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
