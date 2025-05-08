import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:saga/helpers/utils.dart';
import 'package:saga/reader/models/chapter.dart';

class EpubController {
  InAppWebViewController? webViewController;

  var _chapters = <EpubChapter>[];

  void setWebViewController(InAppWebViewController controller) {
    webViewController = controller;
  }

  void display({required String cfi}) {
    checkBookLoaded();
    webViewController?.evaluateJavascript(source: 'toCfi("$cfi")');
  }

  void nextPage() {
    checkBookLoaded();
    webViewController?.evaluateJavascript(source: 'next()');
  }

  void previousPage() {
    checkBookLoaded();
    webViewController?.evaluateJavascript(source: 'previous()');
  }

  Future<EpubLocation> getCurrentLocation() async {
    checkBookLoaded();
    final result = await webViewController?.evaluateJavascript(source: 'getCurrentLocation()');

    if (result == null) {
      throw Exception("Epub locations not loaded");
    }

    return EpubLocation.fromJson(result);
  }

  List<EpubChapter> getChapters() {
    checkBookLoaded();
    return _chapters;
  }

  Future<List<EpubChapter>> parseChapters() async {
    if (_chapters.isNotEmpty) return _chapters;
    checkBookLoaded();
    final result = await webViewController!.evaluateJavascript(source: 'getChapters()');

    _chapters =
        (result as List<dynamic>).map((json) {
          final chapter = EpubChapter.fromJson(EpubChapter.json(json as Map<Object?, Object?>));
          return chapter;
        }).toList();
    return _chapters;
  }

  void addHighlight({
    required String cfi,
    Color color = Colors.lightGreenAccent,
    double opacity = 0.3,
  }) {
    var colorHex = color.toHex();
    var opacityString = opacity.toString();
    checkBookLoaded();
    webViewController?.evaluateJavascript(
      source: 'addHighlight("$cfi", "$colorHex", "$opacityString")',
    );
  }

  void addUnderline({required String cfi}) {
    checkBookLoaded();
    webViewController?.evaluateJavascript(source: 'addUnderLine("$cfi")');
  }

  void removeHighlight({required String cfi}) {
    checkBookLoaded();
    webViewController?.evaluateJavascript(source: 'removeHighlight("$cfi")');
  }

  void removeUnderline({required String cfi}) {
    checkBookLoaded();
    webViewController?.evaluateJavascript(source: 'removeUnderLine("$cfi")');
  }

  void setSpread({required EpubSpread spread}) async {
    await webViewController?.evaluateJavascript(source: 'setSpread("$spread")');
  }

  void setFontSize({required double fontSize}) async {
    await webViewController?.evaluateJavascript(source: 'setFontSize("$fontSize")');
  }

  void updateTheme({required EpubTheme theme}) async {
    String? background = theme.background.toHex();
    String? foreground = theme.foreground.toHex();
    await webViewController?.evaluateJavascript(source: 'updateTheme("$background","$foreground")');
  }

  Completer<EpubTextExtractRes> pageTextCompleter = Completer<EpubTextExtractRes>();

  Future<EpubTextExtractRes> extractText({required startCfi, required endCfi}) async {
    checkBookLoaded();
    pageTextCompleter = Completer<EpubTextExtractRes>();
    await webViewController?.evaluateJavascript(source: 'getTextFromCfi("$startCfi","$endCfi")');
    return pageTextCompleter.future;
  }

  Future<EpubTextExtractRes> extractCurrentPageText() async {
    checkBookLoaded();
    pageTextCompleter = Completer<EpubTextExtractRes>();
    await webViewController?.evaluateJavascript(source: 'getCurrentPageText()');
    return pageTextCompleter.future;
  }

  void toProgressPercentage(double progressPercent) {
    assert(
      progressPercent >= 0.0 && progressPercent <= 1.0,
      'Progress percentage must be between 0.0 and 1.0',
    );
    checkBookLoaded();
    webViewController?.evaluateJavascript(source: 'toProgress($progressPercent)');
  }

  void moveToFistPage() {
    toProgressPercentage(0.0);
  }

  void moveToLastPage() {
    toProgressPercentage(1.0);
  }

  void checkBookLoaded() {
    if (webViewController == null) {
      throw Exception("Epub viewer is not loaded, wait for onEpubLoaded callback");
    }
  }
}
