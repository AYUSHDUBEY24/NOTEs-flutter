import 'package:flutter/material.dart';

class Note {
  String title;
  String description;

  Note({
    required this.title,
    required this.description,
  });
}

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  final TextEditingController titleController =
      TextEditingController();

  final TextEditingController descriptionController =
      TextEditingController();

  List<Note> notes = [];

  final List<Color> colors = [
    Colors.blue.shade200,
    Colors.green.shade200,
    Colors.orange.shade200,
    Colors.pink.shade200,
    Colors.purple.shade200,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
  elevation: 0,
  centerTitle: true,
  backgroundColor: Colors.deepPurple,
  foregroundColor: Colors.white,
  title: const Text(
    "My Notes",
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
  ),
  actions: [
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.settings),
    ),
  ],
),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: descriptionController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (titleController.text.isNotEmpty &&
                      descriptionController.text.isNotEmpty) {
                    setState(() {
                      notes.add(
                        Note(
                          title: titleController.text,
                          description:
                              descriptionController.text,
                        ),
                      );
                    });

                    titleController.clear();
                    descriptionController.clear();
                  }
                },
                child: const Text("Add Note"),
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: notes.isEmpty
                  ? const Center(
                      child: Text(
                        "No Notes Yet 📝",
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  : GridView.builder(
                      itemCount: notes.length,

                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.9,
                      ),

                      itemBuilder: (context, index) {
                        return Card(
                          color: colors[
                              index % colors.length],

                          elevation: 5,

                          child: Padding(
                            padding:
                                const EdgeInsets.all(10),

                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,

                              children: [
                                Text(
                                  notes[index].title,

                                  style:
                                      const TextStyle(
                                    fontWeight:
                                        FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),

                                const SizedBox(
                                    height: 8),

                                Expanded(
                                  child: Text(
                                    notes[index]
                                        .description,

                                    overflow:
                                        TextOverflow.fade,
                                  ),
                                ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.end,

                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.edit,
                                      ),

                                      onPressed: () {
                                        TextEditingController
                                            editTitle =
                                            TextEditingController(
                                          text: notes[index]
                                              .title,
                                        );

                                        TextEditingController
                                            editDescription =
                                            TextEditingController(
                                          text: notes[index]
                                              .description,
                                        );

                                        showDialog(
                                          context:
                                              context,

                                          builder:
                                              (context) {
                                            return AlertDialog(
                                              title:
                                                  const Text(
                                                "Edit Note",
                                              ),

                                              content:
                                                  SingleChildScrollView(
                                                child:
                                                    Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,

                                                  children: [
                                                    TextField(
                                                      controller:
                                                          editTitle,

                                                      decoration:
                                                          const InputDecoration(
                                                        labelText:
                                                            "Title",
                                                      ),
                                                    ),

                                                    const SizedBox(
                                                        height:
                                                            10),

                                                    TextField(
                                                      controller:
                                                          editDescription,

                                                      maxLines:
                                                          3,

                                                      decoration:
                                                          const InputDecoration(
                                                        labelText:
                                                            "Description",
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              actions: [
                                                TextButton(
                                                  onPressed:
                                                      () {
                                                    Navigator.pop(
                                                        context);
                                                  },
                                                  child:
                                                      const Text(
                                                    "Cancel",
                                                  ),
                                                ),

                                                TextButton(
                                                  onPressed:
                                                      () {
                                                    if (editTitle
                                                            .text
                                                            .isNotEmpty &&
                                                        editDescription
                                                            .text
                                                            .isNotEmpty) {
                                                      setState(
                                                          () {
                                                        notes[index]
                                                                .title =
                                                            editTitle
                                                                .text;

                                                        notes[index]
                                                                .description =
                                                            editDescription
                                                                .text;
                                                      });

                                                      Navigator.pop(
                                                          context);
                                                    }
                                                  },
                                                  child:
                                                      const Text(
                                                    "Save",
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),

                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                      ),

                                      onPressed: () {
                                        setState(() {
                                          notes.removeAt(
                                              index);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}