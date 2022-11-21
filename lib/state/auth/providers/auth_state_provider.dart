import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/auth_state.dart';
import '../notifiers/auth_state_notifier.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
  (_) => AuthStateNotifier(),
);
