import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_test_app/create_todo.dart';
import 'package:river_test_app/repo.dart';

class TodoWorkScreen extends ConsumerWidget {
  const TodoWorkScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoProvider);
    final loginRepoProviderScreen = ref.watch(loginRepoProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo Work"),
      ),
      body: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: todoList.myList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(todoList.myList[index]),
                        IconButton(
                          onPressed: () {
                            todoList.deleteData(index);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ));
              })
        ],
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () {
              todoList.addData("test3");
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              loginRepoProviderScreen.loginEmailUser(
                userName: "userName",
                password: "password",
                deviceId: "deviceId",
              );
            },
            child: const Icon(Icons.login),
          ),
        ],
      ),
    );
  }
}
