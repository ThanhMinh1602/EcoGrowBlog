import 'package:eco_grow/core/components/custom_grid_view.dart';
import 'package:eco_grow/core/components/responsive/banner_responsive.dart';
import 'package:eco_grow/core/components/responsive/footer_responsive.dart';
import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:eco_grow/core/utils/app_utils.dart';
import 'package:eco_grow/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final isMobile = context.getWidth() < AppUtils.defineScreenMobile;
    const bannerImageUrl =
        'https://cdn.pixabay.com/photo/2024/03/07/22/56/woman-8619487_1280.jpg';
    const bannerTitle = 'Sự góp ý của bạn sẽ giúp chúng tôi hoàn thiện hơn!';

    String name = '';
    String phone = '';
    String email = '';
    String message = '';

    Future<void> sendEmail() async {
      String username = 'your-email@gmail.com'; // Enter your email here
      String password =
          'your-password'; // Enter your email password or app-specific password

      final smtpServer = gmail(username, password);

      final emailMessage = Message()
        ..from = Address(username, 'Your Name')
        ..recipients.add('ntminh16201@gmail.com') // Recipient's email
        ..subject = 'Liên hệ từ ứng dụng của bạn'
        ..text =
            'Tên: $name\nSố điện thoại: $phone\nEmail: $email\nNội dung: $message';

      try {
        final sendReport = await send(emailMessage, smtpServer);
        print('Message sent: ' + sendReport.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email sent successfully!')),
        );
      } on MailerException catch (e) {
        print('Message not sent. \n${e.toString()}');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to send email.')),
        );
      }
    }

    return ListView(
      children: [
        BannerResponsive(
            isMobileWeb: isMobile,
            bannerImageUrl: bannerImageUrl,
            bannerTitle: bannerTitle),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 300),
          child: CustomAppGridView(
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
        ),
        const SizedBox(height: 50.0),
        Center(
          child: SizedBox(
            width: context.getWidth() * 0.7,
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Liên hệ với chúng tôi',
                    style: AppStyle.titleText
                        .copyWith(color: AppColor.accentColor),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Họ và tên *',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            name = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Vui lòng nhập họ và tên';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Điện thoại *',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            phone = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Vui lòng nhập số điện thoại';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email *',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    maxLines: 4,
                    decoration: const InputDecoration(
                      labelText: 'Nội Dung',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      message = value;
                    },
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          sendEmail();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // Button color
                      ),
                      child: const Text('Gửi Đi'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 30.0),
        FooterResponsive(isWebMobile: isMobile)
      ],
    );
  }
}
