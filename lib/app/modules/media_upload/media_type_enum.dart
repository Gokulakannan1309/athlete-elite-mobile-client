// import 'dart:io';

// enum MediaType { image, video }

// class SelectedMedia {
//   final File? file;
//   final String? networkUrl;
//   final MediaType type;

//   SelectedMedia({
//     this.file,
//     this.networkUrl,
//     required this.type,
//   });
// }



import 'dart:io';

enum MediaType { image, video }

class SelectedMedia {
  final File? file;
  final String? networkUrl;
  final MediaType type;

  // Optional: Track if filter has been applied
  final String? appliedFilterName;
  final bool hasFilter;

  SelectedMedia({
    this.file,
    this.networkUrl,
    required this.type,
    this.appliedFilterName,
    this.hasFilter = false,
  });

  // Copy with method for updating properties
  SelectedMedia copyWith({
    File? file,
    String? networkUrl,
    MediaType? type,
    String? appliedFilterName,
    bool? hasFilter,
  }) {
    return SelectedMedia(
      file: file ?? this.file,
      networkUrl: networkUrl ?? this.networkUrl,
      type: type ?? this.type,
      appliedFilterName: appliedFilterName ?? this.appliedFilterName,
      hasFilter: hasFilter ?? this.hasFilter,
    );
  }
}
