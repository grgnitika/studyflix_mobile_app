import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/category_bloc.dart';
import '../view_model/category_state.dart';

class CategoryView extends StatelessWidget {
  CategoryView({super.key});

  final categoryNameController = TextEditingController();
  final _categoryFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _categoryFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: categoryNameController,
                decoration: const InputDecoration(labelText: 'Category Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a category name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_categoryFormKey.currentState!.validate()) {
                    context.read<CategoryBloc>().add(
                          AddCategory(
                            name: categoryNameController.text,
                          ),
                        );
                    categoryNameController.clear();
                  }
                },
                child: const Text('Add Category'),
              ),
              const SizedBox(height: 10),
              BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const CircularProgressIndicator();
                  }
                  if (state.error != null) {
                    return Center(child: Text('Error: ${state.error}'));
                  }
                  if (state.categories.isEmpty) {
                    return const Center(child: Text('No Categories Added Yet'));
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.categories.length,
                      itemBuilder: (context, index) {
                        final category = state.categories[index];

                        return ListTile(
                          title: Text(category.name),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon:
                                    const Icon(Icons.edit, color: Colors.blue),
                                onPressed: () {
                                  categoryNameController.text = category.name;

                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("Edit Category"),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextFormField(
                                              controller:
                                                  categoryNameController,
                                              decoration: const InputDecoration(
                                                  labelText: "Category Name"),
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text("Cancel"),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              context.read<CategoryBloc>().add(
                                                    UpdateCategory(
                                                      id: category.id!,
                                                      name:
                                                          categoryNameController
                                                              .text,
                                                    ),
                                                  );
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Save"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  context.read<CategoryBloc>().add(
                                        DeleteCategory(id: category.id ?? ''),
                                      );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
