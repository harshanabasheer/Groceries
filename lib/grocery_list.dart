import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:groceries/provider/provider_page.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {


  @override
  Widget build(BuildContext context) {
    final object=Provider.of<Provider_class>(context);
    List name=object.items;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black45,
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.black54,
            context: context,
            builder: (BuildContext context) {
             return Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      onChanged: (value) {
                        object.updateItemText(value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Item',
                      ),
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        object.addItem();
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black45,
                      ),
                      child: Text(
                        'Add to List',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ],
                ),

              );

            },
          );
        },
        child:Icon(Icons.add,color: Colors.white,) ,
      ),
      appBar: AppBar(title: const Text("Groceries",style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black45,),
      body:
      ListView.builder(
          itemCount: name.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Text(name[index],style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: Icon(Icons.check_box,color: Colors.grey,),
              ),
            );
          }),
    );
  }
}