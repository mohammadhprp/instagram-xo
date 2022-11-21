import 'package:logger/logger.dart';

extension Log on Object {
  void log() => Logger().i(toString());
}
