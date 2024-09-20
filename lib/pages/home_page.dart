import 'package:flutter/material.dart';
import 'package:habbit_tracker/components/my_drawer.dart';
import 'package:habbit_tracker/database/habit_database.dart';
import 'package:habbit_tracker/models/habit.dart';
import 'package:provider/provider.dart';

import '../utils/habit_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<HabitDatabase>(context, listen: false).readHabits();
    super.initState();
  }

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
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        // get new habit name
                        String newHabitName = habitTextController.text;
                        //save to db
                        context.read<HabitDatabase>().addHabit(newHabitName);
                        //pop box
                        Navigator.pop(context);
                        //clear control
                        habitTextController.clear();
                      },
                      child: Text("Save"),
                    ),
                  ],
                ),
                //cancel
                MaterialButton(
                    child: const Text("Cancel"),
                    onPressed: () {
                      habitTextController.clear();
                      Navigator.pop(context);
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
      body: _buildHabitList(),
    );
  }

  Widget _buildHabitList() {
    //habit db
    final habitDatabase = context.watch<HabitDatabase>();

    //current habit
    List<Habit> currentHabit = habitDatabase.currentHabits;

    //return list of habit UI
    return ListView.builder(
        itemCount: currentHabit.length,
        itemBuilder: (context, index) {
          //get each individual habit
          final habit = currentHabit[index];
          //check if habit is completed today
          bool isCompletedToday = isHabitCompletedToday(habit.completedDays);

          //return habit title UI
          return ListTile(
            title: Text(habit.name),
          );
        });
  }
}
