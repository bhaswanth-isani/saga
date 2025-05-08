import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saga/auth/models/session.dart';
import 'package:saga/auth/models/user.dart';
import 'package:saga/core/database.dart';

part 'current_user.g.dart';

@Riverpod(keepAlive: true)
Stream<User?> currentUser(Ref ref) => ref
    .watch(databaseProvider)
    .managers
    .users
    .watch(limit: 1)
    .map((event) => event.firstOrNull?.toObject());

@Riverpod(keepAlive: true)
Stream<Session?> currentSession(Ref ref) => ref
    .watch(databaseProvider)
    .managers
    .sessions
    .watch(limit: 1)
    .map((event) => event.firstOrNull?.toObject())
    .map((s) {
      ref.read(dioClientProvider.notifier).setToken(s?.token);
      return s;
    });
