import 'dart:convert';
import 'dart:typed_data' show Uint8List;

class FFLocalFile {
  const FFLocalFile({
    this.name,
    this.bytes,
  });

  final String? name;
  final Uint8List? bytes;

  @override
  String toString() => 'FFLocalFile(name: $name, bytes: ${bytes?.length ?? 0})';

  String serialize() => jsonEncode({'name': name, 'bytes': bytes});

  static FFLocalFile deserialize(String val) {
    final serializedData = jsonDecode(val) as Map<String, dynamic>;
    final data = {
      'name': serializedData['name'] ?? '',
      'bytes': serializedData['bytes'] ?? Uint8List.fromList([]),
    };
    return FFLocalFile(
      name: data['name'] as String,
      bytes: data['bytes'] as Uint8List,
    );
  }

  @override
  int get hashCode => Object.hash(name, bytes);

  @override
  bool operator ==(other) =>
      other is FFLocalFile && name == name && bytes == bytes;
}
