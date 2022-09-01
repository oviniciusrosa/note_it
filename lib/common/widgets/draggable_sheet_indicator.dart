import 'package:flutter/material.dart';

class DraggableSheetIndicator extends StatelessWidget {
  const DraggableSheetIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 45,
        height: 4,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(60),
        ),
      ),
    );
  }
}
