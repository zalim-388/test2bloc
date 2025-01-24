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
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Name:${state.name}'),
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () => openDialog(context,
                                    field: 'name', value: state.name),
                                icon: Icon(
                                  Icons.edit_outlined,
                                  size: 16,
                                )),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Age: ${state.age}'),
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () => openDialog(context,
                                    field: 'Name', value: state.age),
                                icon: Icon(
                                  Icons.edit_outlined,
                                  size: 16,
                                ))
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Place: ${state.place}'),
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () => openDialog(context,
                                    field: 'place', value: state.place),
                                icon: Icon(
                                  Icons.edit_outlined,
                                  size: 16,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openDialog(context, field: '', value: ''),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> openDialog(BuildContext context,
      {required String? field, required value}) async {
    if (field == 'name') {
      nameController.text = value;
  
    } if  (field == 'age') {
      ageController.text = value;
     
     
    } if (field == 'place') {
      placeController.text = value;
   
    } else {
     
    }
    void submit(BuildContext context, {String? field, required dynamic value}) {
      switch (field) {
        case 'name':
          context.read<Counter>().changeName(value);
          break;
        case 'age':
          context.read<Counter>().changeAge(value);
          break;
        case 'place':
          context.read<Counter>().changePlace(value);
          break;
        default:
          break;
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
                    onPressed: () {
                      final value = field == 'name'
                          ? nameController.text.trim()
                          : field == 'age'
                              ? ageController.text.trim()
                              : placeController.text.trim();
                      (context, field: field, value: '');
                            submit(context, field: field, value: value);
                    
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
