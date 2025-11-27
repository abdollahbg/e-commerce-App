import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CounterNumberOfProduct extends StatefulWidget {
  CounterNumberOfProduct({super.key, required this.initialCount});
  final int initialCount;
  int count = 0;

  @override
  State<CounterNumberOfProduct> createState() => _CounterNumberOfProductState();
}

class _CounterNumberOfProductState extends State<CounterNumberOfProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              setState(() {
                if (widget.count > 0) {
                  widget.count--;
                }
              });
            },
          ),
          Text('${widget.count}', style: const TextStyle(fontSize: 16)),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                widget.count++;
              });
            },
          ),
        ],
      ),
    );
  }
}
