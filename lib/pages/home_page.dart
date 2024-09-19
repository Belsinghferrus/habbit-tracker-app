import 'package:flutter/material.dart';
import 'package:habbit_tracker/components/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController habitTextController = TextEditingController();

  //create new habit
  void createNewHabit() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Create New Habit"),
              content: TextField(
                autocorrect: true,
                controller: habitTextController,
                decoration: const InputDecoration(
                    hintText: "Wake up at 6:00 am",
                    border: OutlineInputBorder()),
              ),
              actions: [
                //save
                MaterialButton(onPressed: () {
                  // get new habit name

                  //save to db

                  //pop box

                  //clear control
                }),
                //cancel
                MaterialButton(
                    child: const Text("Cancel"),
                    onPressed: () {
                      habitTextController.clear();
                      Navigator.of(context).pop();
                    })
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewHabit,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
