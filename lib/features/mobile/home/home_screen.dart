import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/extensions/double_extension.dart';
import 'package:eco_grow/model/donate_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final datas = DonateModel.datas;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      children: [
        const SizedBox(height: 20),
        _buildSectionTitle("Ủng hộ nổi bật"),
        const SizedBox(height: 10),
        ListView.builder(
          itemCount: 2,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return _buildDonateCard(datas[index]);
          },
        ),
        const SizedBox(height: 20),
        _buildSectionTitle("Ủng hộ mới nhất"),
        const SizedBox(height: 10),
        ListView.builder(
          itemCount: 2,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return _buildDonateCard(datas[index]);
          },
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: AppColor.accentColor,
      ),
    );
  }

  Widget _buildDonateCard(DonateModel donate) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "#${donate.transactionCode}", // Sử dụng ID từ DonateModel
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w100,
              ),
            ),
            Text(
              donate.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Số tiền quyên góp: ${donate.money.toVND()}",
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: AppColor.accentColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                donate.note, // Trạng thái từ DonateModel
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColor.accentColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
