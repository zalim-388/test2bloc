import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2bloc/bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController placeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<Counter, Counterstate>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Name:${state.name}'),
                Text('Age: ${state.age}'),
                Text('Place: ${state.place}'),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> openDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => SimpleDialog(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: 'Name',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    decoration: const InputDecoration(
                      hintText: 'Age',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: placeController,
                    decoration: const InputDecoration(
                      hintText: 'Place',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => submit(context),
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  void submit(BuildContext context) {
    final name = nameController.text;
    final age = ageController.text;
    final place = placeController.text;

    context.read<Counter>()
      ..changeName(name)
      ..changeAge(age)
      ..changePlace(place);

    nameController.clear();
    ageController.clear();
    placeController.clear();
    Navigator.of(context).pop();
  }
}
