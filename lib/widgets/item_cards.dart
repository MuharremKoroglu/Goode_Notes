import 'package:flutter/material.dart';

class ItemCards extends StatelessWidget {
  final String title;
  final bool isDone;
  var toggleStatus;
  var deleteItem;
  ItemCards({
    required this.title,
    required this.isDone,
    required this.toggleStatus,
    required this.deleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: deleteItem,
      key: UniqueKey(),
      child: Card(
        color: isDone ? Colors.teal.shade50 : Colors.white,
        elevation: isDone ? 1 : 5,
        shadowColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: ListTile(
          title: Text(
            '$title',
            style: TextStyle(
              color: Colors.black,
              decoration: isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Checkbox(
            value: isDone,
            onChanged: toggleStatus,
            activeColor: Colors.green,
          ),
        ),
      ),
    );
  }
}
