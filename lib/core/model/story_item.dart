class StoryItemModel {
  final String id;
  final String title;
  final String subTitle;
  final String content;
  final String imagePath;
  StoryItemModel(
      {required this.id,
      required this.title,
      required this.subTitle,
      required this.content,
      required this.imagePath});

  static List<StoryItemModel> stories = [
    StoryItemModel(
      id: '0',
      title: 'Xử Lý Mùi Hố Thu Gom Phân Xí Nghiệp Chăn Nuôi Heo Đồng Hiệp',
      subTitle:
          'Chất thải từ hoạt động chăn nuôi bao gồm nước thải và chất thải rắn (chủ yếu là phân từ hoạt động sản xuất)',
      content: '',
      imagePath:
          'https://cdn.pixabay.com/photo/2024/02/27/23/18/insect-8600910_960_720.jpg',
    ),
    StoryItemModel(
      id: '0',
      title: 'Xử Lý Mùi Hố Thu Gom Phân Xí Nghiệp ',
      subTitle: 'Chất thải từ hoạt động chăn nuôi ',
      content: '',
      imagePath:
          'https://cdn.pixabay.com/photo/2024/02/27/23/18/insect-8600910_960_720.jpg',
    ),
    StoryItemModel(
      id: '0',
      title: 'Xử Lý Mùi Hố Thu Gom Phân Xí Nghiệp Chănp',
      subTitle: 'Chất thải từ hoạt động chăn ',
      content: '',
      imagePath:
          'https://cdn.pixabay.com/photo/2024/02/27/23/18/insect-8600910_960_720.jpg',
    ),
    StoryItemModel(
      id: '0',
      title: 'Xử Lý Mùi Hố Thu ',
      subTitle: 'Chất thải ',
      content: '',
      imagePath:
          'https://cdn.pixabay.com/photo/2024/02/27/23/18/insect-8600910_960_720.jpg',
    ),
  ];
}
