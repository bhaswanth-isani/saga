import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

abstract class EpubDataLoader {
  Future<Uint8List> loadBook();
}

class FileEpubLoader implements EpubDataLoader {
  const FileEpubLoader(this.file);

  final File file;

  @override
  Future<Uint8List> loadBook() async {
    return await file.readAsBytes();
  }
}

class NetworkEpubLoader implements EpubDataLoader {
  const NetworkEpubLoader(this.url, {this.headers});

  final String url;
  final Map<String, String>? headers;

  @override
  Future<Uint8List> loadBook() async {
    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        return response.bodyBytes;
      } else {
        throw Exception('Failed to download file from URL');
      }
    } catch (e) {
      throw Exception('Failed to download file from URL, $e');
    }
  }
}

class AssetEpubLoader implements EpubDataLoader {
  const AssetEpubLoader(this.assetName);

  final String assetName;

  @override
  Future<Uint8List> loadBook() async {
    return await rootBundle.load(assetName).then((value) => value.buffer.asUint8List());
  }
}

class EpubSource {
  const EpubSource._(this.epubData);

  final Future<Uint8List> epubData;

  factory EpubSource.fromFile(File file) {
    return EpubSource._(FileEpubLoader(file).loadBook());
  }

  factory EpubSource.fromNetwork(String url, {Map<String, String>? headers}) {
    return EpubSource._(NetworkEpubLoader(url, headers: headers).loadBook());
  }

  factory EpubSource.fromAsset(String assetName) {
    return EpubSource._(AssetEpubLoader(assetName).loadBook());
  }
}
