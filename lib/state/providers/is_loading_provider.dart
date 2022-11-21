import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../auth/providers/auth_state_provider.dart';
import '../image_upload/providers/image_upload_provider.dart';

final isLoadingProvider = Provider<bool>(
  (ref) {
    final authState = ref.watch(authStateProvider);
    final isUploadImage = ref.watch(imageUploadProvider);
    return authState.isLoading || isUploadImage;
  },
);
