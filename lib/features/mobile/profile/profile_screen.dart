import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:eco_grow/core/utils/app_utils.dart';
import 'package:eco_grow/features/mobile/login/login_screen.dart';
import 'package:eco_grow/features/mobile/splash/splash_screen.dart';
import 'package:eco_grow/service/local/shared_preferences_service.dart';
import 'package:eco_grow/service/remote/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppUtils.mobilePaddingHoriz),
      children: [
        const Text(
          textAlign: TextAlign.center,
          'Thông tin cá nhân',
          style: AppStyle.titleTextWebMobile,
        ),
        const SizedBox(height: 10),
        _buildSection(
            child: Row(
          children: [
            CircleAvatar(
              radius: 40.0.w,
              backgroundImage: const NetworkImage(
                  'https://cdn.pixabay.com/photo/2022/05/22/16/50/outdoors-7213961_1280.jpg'),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nguyễn Thanh Minh',
                  style: AppStyle.textContent
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const Text('ntminh16201@gmail.com'),
              ],
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                  size: 18,
                ))
          ],
        )),
        _buildSection(
          child: Column(
            children: [
              _buildSectionItem(
                  icon: Icons.attach_money_outlined, label: 'Số dư'),
            ],
          ),
        ),
        const Text('More'),
        const SizedBox(height: 5.0),
        _buildSection(
          child: Column(
            children: [
              _buildSectionItem(
                  icon: Icons.favorite_border, label: 'About App'),
              _buildSectionItem(
                  icon: Icons.notifications_none, label: 'Help & Support'),
              _buildSectionItem(
                icon: Icons.logout,
                label: 'Logout',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Đăng xuất'),
                        content: const Text('Bạn có chắc chắn muốn đăng xuất'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              SharedPreferencesService().clearUid();
                              AuthService().signOut();
                              context.pushAndRemoveUntil(
                                  screen: const LoginScreen());
                            },
                            child: const Text('Ok'),
                          )
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildSectionItem(
      {required IconData icon, required String label, void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(children: [
          CircleAvatar(
            radius: 23.0.w,
            child: Icon(
              icon,
              color: AppColor.accentColor,
            ),
          ),
          const SizedBox(width: 10.0),
          Text(label),
          const Spacer(),
          Icon(
            Icons.navigate_next_sharp,
            size: 20.0.w,
          )
        ]),
      ),
    );
  }

  Widget _buildSection({Color? backGroundColoer, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
          color: backGroundColoer ?? AppColor.whiteColor,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: AppColor.appBoxShaDowns),
      child: child,
    );
  }
}
