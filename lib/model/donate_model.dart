import 'dart:convert';
import 'dart:math';

class DonateModel {
  final String transactionCode;
  final String name;
  final double money;
  final String note;
  final DateTime createAt;

  DonateModel({
    required this.transactionCode,
    required this.name,
    required this.money,
    required this.note,
    required this.createAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'transactionCode': transactionCode,
      'name': name,
      'donatePrice': money,
      'note': note,
      'createAt': createAt.toIso8601String(),
    };
  }

  static List<DonateModel> datas = generateFakeData(128);
}

List<DonateModel> generateFakeData(int numRecords) {
  Random random = Random();
  List<DonateModel> donations = [];

  for (int i = 0; i < numRecords; i++) {
    String transactionCode = 'TR${i.toString().padLeft(6, '0')}';
    String name = 'Name $i';
    double donatePrice = (random.nextDouble() * 990 + 10).roundToDouble();
    String note = 'This is a note for transaction $i';
    DateTime createAt =
        DateTime.now().subtract(Duration(days: random.nextInt(30)));

    donations.add(DonateModel(
      transactionCode: transactionCode,
      name: name,
      money: donatePrice,
      note: note,
      createAt: createAt,
    ));
  }
  return donations;
}
