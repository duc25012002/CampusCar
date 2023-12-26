// ignore: file_names
import 'package:campus_car_joco/features/search/controller/SearchAccessLogController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchAccessLog extends StatefulWidget {
  const SearchAccessLog({super.key});

  @override
  State<SearchAccessLog> createState() => _SearchAccessLogState();
}

class _SearchAccessLogState extends State<SearchAccessLog> {
  final SearchAccessLogController _controller =
      Get.find<SearchAccessLogController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            TextButton(
                onPressed: () {
                  //return Get.back();
                },
                child: const Text("Back")),
            Center(
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width - 30,
                child: TextFormField(
                  controller: _controller.keySearchController,
                  // onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: "Search",
                    labelStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.3122410774),
                      borderSide: const BorderSide(
                        color: Color(0xffc0c0c0),
                      ),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  ),
                ),
              ),
            ),
            Center(
              child: TextButton(
                  onPressed: () {
                    _controller
                        .getAccessLog(_controller.keySearchController.text);
                  },
                  child: const Text("Search")),
            )
          ],
        ),
      ),
    );
  }
}
