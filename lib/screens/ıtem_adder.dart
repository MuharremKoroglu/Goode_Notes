import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../models/items_data.dart';

class ItemAdder extends StatelessWidget {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: textController,
              onChanged: (input) {
                print(textController.text);
              },
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
              decoration: InputDecoration(
                hintText: 'Add Item',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              //autofocus: true,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              onPressed: () {
                if (textController.text == '') {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.WARNING,
                    animType: AnimType.BOTTOMSLIDE,
                    title: 'Warning',
                    desc: 'You have to enter a note!',
                    btnCancelColor: Colors.amber,
                    btnCancelOnPress: () {},
                  ).show();
                } else {
                  Provider.of<ItemsData>(context, listen: false)
                      .addItem(textController.text);
                  Navigator.pop(context);
                }
              },
              child: Text(
                'ADD',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
