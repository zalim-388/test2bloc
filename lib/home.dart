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
                Container(
                  height: 180,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Name: ${state.name}'),
                            const Spacer(),
                            IconButton(
                              onPressed: () => openDialog(
                                context,
                                field: 'name',
                                value: state.name,
                              ),
                              icon: const Icon(Icons.edit_outlined, size: 16),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          children: [
                            Text('Age: ${state.age}'),
                            const Spacer(),
                            IconButton(
                              onPressed: () => openDialog(
                                context,
                                field: 'age',
                                value: state.age,
                              ),
                              icon: const Icon(Icons.edit_outlined, size: 16),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          children: [
                            Text('Place: ${state.place}'),
                            const Spacer(),
                            IconButton(
                              onPressed: () => openDialog(
                                context,
                                field: 'place',
                                value: state.place,
                              ),
                              icon: const Icon(Icons.edit_outlined, size: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          nameController.clear();
          ageController.clear();
          placeController.clear();
          openDialog(context, field: 'add', value: '');
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> openDialog(BuildContext context,
      {required String field, required dynamic value}) async {
    if (field != 'add') {
      switch (field) {
        case 'name':
          nameController.text = value;
          break;
        case 'age':
          ageController.text = value.toString();
          break;
        case 'place':
          placeController.text = value;
          break;
        default:
          break;
      }
    }

    void submit(BuildContext context, {required String field}) {
      if (field == 'add') {
        // For adding new data (default behavior if no specific field is passed)
        context.read<Counter>().changeName(nameController.text.trim());
        context.read<Counter>().changeAge(ageController.text.trim());
        context.read<Counter>().changePlace(placeController.text.trim());
      } else {
        // For updating specific fields
        switch (field) {
          case 'name':
            context.read<Counter>().changeName(nameController.text.trim());
            break;
          case 'age':
            context.read<Counter>().changeAge(ageController.text.trim());
            break;
          case 'place':
            context.read<Counter>().changePlace(placeController.text.trim());
            break;
          default:
            break;
        }
      }
      Navigator.of(context).pop();
    }

    showDialog(
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
                TextField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                  decoration: const InputDecoration(
                    hintText: 'Age',
                    border: UnderlineInputBorder(),
                  ),
                ),
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
                    onPressed: () {
                      submit(context, field: field);
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


  Future<void> openDialog(BuildContext context, void clear,
dynamic nameController, dynamic ageController, dynamic placeController,       {required String field, required dynamic value}) async {
    if (field != 'add') {
      switch (field) {
        case 'name':
          nameController.text = value;
          break;
        case 'age':
          ageController.text = value.toString();
          break;
        case 'place':
          placeController.text = value;
          break;
        default:
          break;
      }
    }

    void submit(
      BuildContext context, {
      required String field,
    }) {
      if (field == 'add') {
        context.read<Counter>().changeName(nameController.text.trim());
        context.read<Counter>().changeAge(ageController.text.trim());
        context.read<Counter>().changePlace(placeController.text.trim());
      } else {
        switch (field) {
          case 'name':
            context.read<Counter>().changeName(nameController.text.trim());
            break;
          case 'age':
            context.read<Counter>().changeAge(ageController.text.trim());
            break;
          case 'place':
            context.read<Counter>().changePlace(placeController.text.trim());
            break;
          default:
            break;
        }
      }
      Navigator.of(context).pop();
    }

    showDialog(
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
                TextField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                  decoration: const InputDecoration(
                    hintText: 'Age',
                    border: UnderlineInputBorder(),
                  ),
                ),
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
                    onPressed: () {
                      submit(
                        context,
                        field: field,
                      );
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

