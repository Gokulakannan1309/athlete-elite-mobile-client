// class CategoryUIModel {
//   final String categoryName;
//   final List<ChannelUIModel> channels;

//   CategoryUIModel({
//     required this.categoryName,
//     required this.channels,
//   });
// }

// class ChannelUIModel {
//   final String title;
//   final String thumbnail;
//   final String videoUrl;

//   ChannelUIModel({
//     required this.title,
//     required this.thumbnail,
//     required this.videoUrl,
//   });
// }


class CategoryUIModel {
  final String categoryName;
  final List<ChannelUIModel> channels;

  CategoryUIModel({
    required this.categoryName,
    required this.channels,
  });
}

class ChannelUIModel {
  final String title;
  final String thumbnail;
  final String videoUrl;

  ChannelUIModel({
    required this.title,
    required this.thumbnail,
    required this.videoUrl,
  });
}
