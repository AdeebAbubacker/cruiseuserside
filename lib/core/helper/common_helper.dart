import 'dart:io';

/// Checks if the given [url] is a valid, accessible image.
/// Returns true if:
/// 1. URL is not null
/// 2. URL is not empty
/// 3. URL returns HTTP 200 status (not 404)
Future<bool> isValidImageUrl(String? url) async {
  if (url == null || url.isEmpty) return false;

  try {
    final uri = Uri.tryParse(url);
    if (uri == null) return false;

    final request = await HttpClient().headUrl(uri);
    final response = await request.close();

    return response.statusCode == 200;
  } catch (_) {
    return false;
  }
}
