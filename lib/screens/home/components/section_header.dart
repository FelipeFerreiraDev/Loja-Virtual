import 'package:BJDelivery/models/section.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {

  const SectionHeader(this.section);

  final Section section;

  @override
  Widget build(BuildContext context) {
    return Text(
      section.name,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w800,
        fontSize: 18
      ),
    );
  }
}