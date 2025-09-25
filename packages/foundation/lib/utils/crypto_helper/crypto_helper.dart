import 'dart:convert';

import '../../crypto/src/digest.dart';
import '../../crypto/src/sha256.dart';

class CryptoHelper {
  static String hashString(String input) {
    // Convert the input string to a list of bytes
    List<int> bytes = utf8.encode(input);

    // Compute the SHA-256 hash
    Digest digest = sha256.convert(bytes);

    // Convert the hash to a hexadecimal string
    return digest.toString();
  }
}
