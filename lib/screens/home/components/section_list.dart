import 'package:BJDelivery/models/section.dart';
import 'package:BJDelivery/screens/home/components/section_header.dart';
import 'package:flutter/material.dart';

class SectionList extends StatelessWidget {
  const SectionList(this.section);

  final Section section;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SectionHeader(section),
        ],
      ),
    );
  }
}
