import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key, required this.onTab});
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTab, 
      icon: const Icon(Icons.add, size: 18), 
      label: const Text('일정 추가'),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
    );
  }
}
