import 'dart:developer' as logcat;

// A wrapper to run sync code safely, logging any error.
void safeSync(String label, void Function() run) {
  try {
    logcat.log('$label stated');
    run();
  } catch (e, st) {
    logcat.log('$label failed: $e\n$st');
  }
}
