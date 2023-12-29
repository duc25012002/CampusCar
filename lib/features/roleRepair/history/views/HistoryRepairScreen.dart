import 'package:flutter/material.dart';

class HistoryRepairScreen extends StatefulWidget {
  const HistoryRepairScreen({super.key});

  @override
  State<HistoryRepairScreen> createState() => _HistoryRepairScreenState();
}

class _HistoryRepairScreenState extends State<HistoryRepairScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [Text("Lịch sử ra vào")],
        ),
      ),
    );
  }
}
