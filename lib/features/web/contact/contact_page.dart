import 'package:eco_grow/core/components/app_banner_widget.dart';
import 'package:eco_grow/core/components/custom_grid_view.dart';
import 'package:eco_grow/core/components/footer.dart';
import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:eco_grow/core/model/contact_model.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const AppBannerWidget(
          backgroundImage:
              'https://cdn.pixabay.com/photo/2024/03/07/22/56/woman-8619487_1280.jpg',
          title: 'Sự góp ý của bạn sẽ giúp chúng tôi hoàn thiện hơn!',
        ),
        CustomAppGridView(
          itemCount: 3,
          maxCrossAxisExtent: 400,
          childAspectRatio: 1.7,
          itemBuilder: (context, index) {
            final datas = ContactModel.contactModels;
            return Container(
              padding: EdgeInsets.all(context.getWidth() * 0.02),
              decoration: BoxDecoration(
                  border: Border.all(
                color: AppColor.accentColor,
                width: 3.0,
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(datas[index].icon,
                      size: 30.0, color: AppColor.accentColor),
                  Text(
                    textAlign: TextAlign.center,
                    datas[index].title,
                    style: AppStyle.webHeaderItemActive
                        .copyWith(color: AppColor.accentColor),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 30.0),
        const Footer()
      ],
    );
  }
}
