// melos_scripts/barrel_generator.dart
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

void main() {
  // Define your package paths (relative to project root)
  final _ = {
    'api_response': 'model/apiresponse',
    'entity': 'model/entity',
    'domain': 'core/domain',
  }
  ..forEach((name, relativePath) {
    final libDir = Directory(path.join(Directory.current.path, relativePath, 'lib'));
    if (!libDir.existsSync()) {
      return;
    }
    _generateBarrelFile(libDir, name);
  });
}

void _generateBarrelFile(Directory libDir, String packageName) {
  final barrelFile = File(path.join(libDir.path, '$packageName.dart'));
  final exports = StringBuffer()

  ..writeln('// Barrel file for $packageName package');
  //..writeln('// Generated on ${DateTime.now()}\n');

  // Process src directory if exists
  final srcDir = Directory(path.join(libDir.path, 'src'));
  if (srcDir.existsSync()) {
    exports.writeln('// src exports');
    _addDirectoryExports(srcDir, libDir, exports);
    exports.writeln();
  }

  // Process other Dart files in lib root
  exports.writeln('// lib exports');
  _addDirectoryExports(libDir, libDir, exports, excludeSrc: true);

  // Write to file
  barrelFile.writeAsStringSync(exports.toString());
  //print('📦 Updated ${path.relative(barrelFile.path)}');
}

void _addDirectoryExports(
    Directory dir,
    Directory libDir,
    StringBuffer exports, {
      bool excludeSrc = false,
    }) {
  final dartFiles = dir.listSync(recursive: true)
      .whereType<File>()
      .where((f) => f.path.endsWith('.dart'))
      .where((f) => !f.path.endsWith('.g.dart'))
      .where((f) => !excludeSrc || !f.path.contains('${path.separator}src${path.separator}'))
      .toList()
    ..sort((a, b) => a.path.compareTo(b.path));

  for (final file in dartFiles) {
    final exportPath = path.relative(file.path, from: libDir.path);
    //final exportPath = relativePath.replaceAll('.dart', '');
    exports.writeln("export '$exportPath';");
  }
}