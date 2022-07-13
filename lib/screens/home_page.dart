import 'package:flutter/material.dart';
import 'package:goode_notes/models/items_data.dart';
import 'package:goode_notes/screens/settings_page.dart';
import 'package:goode_notes/widgets/item_cards.dart';
import 'package:provider/provider.dart';
import 'ıtem_adder.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              },
              icon: Icon(Icons.settings),
            ),
          )
        ],
        title: Text(
          'Goode Notes',
          style: Theme.of(context).textTheme.headline3,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                child: Text(
                  '${Provider.of<ItemsData>(context).items.length} Items',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      30,
                    ),
                  ),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Consumer<ItemsData>(
                      builder: (context, itemData, child) {
                        return Align(
                          alignment: Alignment.topCenter,
                          child: ListView.builder(
                            reverse: true,
                            shrinkWrap: true,
                            itemCount: itemData.items.length,
                            itemBuilder: (context, index) => ItemCards(
                              title: itemData.items[index].title,
                              isDone: itemData.items[index].isDone,
                              toggleStatus: (bool) {
                                itemData.toggleStatus(index);
                              },
                              deleteItem: (_) {
                                itemData.deleteItems(index);
                              },
                            ),
                          ),
                        );
                      },
                    )),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25)),
              ),
              isScrollControlled: true,
              context: context,
              builder: (context) => ItemAdder());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
