import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:l02_advance/questions_summary/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  build(context) {
    return SizedBox(
        height: 400,
        child: SingleChildScrollView(
            child: Column(
          children: summaryData.map((data) {
            return SummaryItem(data);
          }).toList(),
        )));
  }
}
