import 'dart:io';

enum MediaType { image, video }

class SelectedMedia {
  final File? file;
  final String? networkUrl;
  final MediaType type;

  SelectedMedia({
    this.file,
    this.networkUrl,
    required this.type,
  });
}
