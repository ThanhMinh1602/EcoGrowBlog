import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:eco_grow/core/components/app_button.dart';
import 'package:eco_grow/core/components/web_button.dart';
import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:flutter/material.dart';

class VisionWidget extends StatelessWidget {
  const VisionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            ColorizeAnimatedText(
              'Tầm nhìn của ECOGROW',
              textStyle: AppStyle.titleText,
              colors: AppColor.homTitleTextColorize,
              speed: const Duration(milliseconds: 100),
            ),
          ],
        ),
        Divider(
          color: AppColor.accentColor,
          indent: context.getWidth() * 0.42,
          endIndent: context.getWidth() * 0.42,
          thickness: 3,
        ),
        const SizedBox(height: 20.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.getWidth() * 0.1),
          child: const Text(
            textAlign: TextAlign.justify,
            'Trong bối cảnh xã hội hiện đại đang ngày càng phát triển, vấn đề môi trường trở thành mối quan tâm cấp thiết. Rừng cây bị phá hủy, khí hậu thay đổi nhanh chóng, và nguồn tài nguyên thiên nhiên bị cạn kiệt. Chúng ta không thể đứng ngoài cuộc khi môi trường xung quanh đang kêu cứu từng ngày. Để đối phó với những thách thức đó, **EcoGrow** ra đời, không chỉ là một dự án cộng đồng, mà là một phong trào mạnh mẽ nhằm "xanh hóa" Trái Đất. **EcoGrow** kêu gọi mọi người chung tay hành động vì một thế giới trong lành hơn, bắt đầu từ việc trồng cây và xây dựng những không gian xanh cho chính chúng ta và thế hệ mai sau. EcoGrow không chỉ là dự án kêu gọi quyên góp vì một cuộc sống xanh, mà chính là ý tưởng của tôi – một học sinh cấp 3. Tôi tin rằng đây sẽ là tiền đề để truyền cảm hứng cho thế hệ trẻ, khuyến khích các bạn dám nghĩ lớn và thực hiện hóa chúng. Từ đó, chúng ta có thể góp phần xây dựng đất nước Việt Nam ngày càng vững mạnh và phồn thịnh, tiếp bước lời Bác Hồ vĩ đại đã từng nói: *"Non sông Việt Nam có trở nên tươi đẹp hay không, dân tộc Việt Nam có bước tới đài vinh quang để sánh vai với các cường quốc năm châu được hay không, chính là nhờ một phần lớn ở công học tập của các em."*',
            style: AppStyle.textContent,
          ),
        ),
        const SizedBox(height: 30.0),
        Image.network(
          'https://cdn-i.vtcnews.vn/resize/th/upload/2024/02/28/song-xanh-16254953.png',
          height: 500.0,
          fit: BoxFit.fill,
        ),
        const SizedBox(height: 50.0),
        const WebButton(
          textButton: "Quyên góp ngay",
        ),
        const SizedBox(height: 50.0),
      ],
    );
  }
}
