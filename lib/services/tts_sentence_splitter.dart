// /// Splits text into sentences suitable for one-at-a-time TTS synthesis.
// /// Each sentence is short enough to synthesize in ~1-2s on device.
// class TtsSentenceSplitter {
//   /// Splits on sentence-ending punctuation while keeping abbreviations intact.
//   static List<String> split(String text) {
//     if (text.trim().isEmpty) return [];
//
//     // Normalize whitespace
//     text = text.replaceAll(RegExp(r'\s+'), ' ').trim();
//
//     // Split on . ! ? followed by space+capital or end of string
//     // This avoids splitting on "Mr. Smith" or "U.S.A."
//     final pattern = RegExp(
//       r'(?<=[.!?])\s+(?=[A-Z"'
//       '(\[])',
//     );
//
//     final rawParts = text.split(pattern);
//
//     final sentences = <String>[];
//     for (var part in rawParts) {
//       part = part.trim();
//       if (part.isEmpty) continue;
//
//       // If a single sentence is very long (>120 chars), split on commas too
//       if (part.length > 120) {
//         final subParts = part.split(RegExp(r',\s+'));
//         String current = '';
//         for (final sub in subParts) {
//           if (current.isEmpty) {
//             current = sub;
//           } else if ((current + ', ' + sub).length <= 120) {
//             current += ', $sub';
//           } else {
//             if (current.trim().isNotEmpty) sentences.add(current.trim());
//             current = sub;
//           }
//         }
//         if (current.trim().isNotEmpty) sentences.add(current.trim());
//       } else {
//         sentences.add(part);
//       }
//     }
//
//     return sentences.where((s) => s.isNotEmpty).toList();
//   }
// }
// ---------------------
class TtsSentenceSplitter {
  /// Splits text into short chunks suitable for streaming TTS.
  ///
  /// Strategy: split on sentence boundaries first, then further split any
  /// chunk longer than [_maxChars] on clause boundaries (comma, semicolon,
  /// colon, em-dash). This keeps each synthesis call under ~200ms.
  static const int _maxChars = 120;

  static List<String> split(String text) {
    // Step 1: split on sentence-ending punctuation
    final sentences = text
        .split(RegExp(r'(?<=[.!?])\s+'))
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();

    // Step 2: further split long sentences on clause boundaries
    final chunks = <String>[];
    for (final sentence in sentences) {
      if (sentence.length <= _maxChars) {
        chunks.add(sentence);
      } else {
        // Split on comma/semicolon/colon/em-dash, preserving the punctuation
        final clauses = sentence
            .split(RegExp(r'(?<=[,;:—])\s+'))
            .map((c) => c.trim())
            .where((c) => c.isNotEmpty)
            .toList();

        // If still too long after clause split, hard-split at word boundary
        for (final clause in clauses) {
          if (clause.length <= _maxChars) {
            chunks.add(clause);
          } else {
            chunks.addAll(_hardSplit(clause));
          }
        }
      }
    }

    return chunks;
  }

  /// Hard-split a long string at word boundaries near [_maxChars]
  static List<String> _hardSplit(String text) {
    final result = <String>[];
    final words = text.split(' ');
    final buffer = StringBuffer();

    for (final word in words) {
      if (buffer.length + word.length + 1 > _maxChars && buffer.isNotEmpty) {
        result.add(buffer.toString().trim());
        buffer.clear();
      }
      if (buffer.isNotEmpty) buffer.write(' ');
      buffer.write(word);
    }

    if (buffer.isNotEmpty) result.add(buffer.toString().trim());
    return result;
  }
}