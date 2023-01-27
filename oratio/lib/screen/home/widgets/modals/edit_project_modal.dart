import 'package:flutter/material.dart';
import 'package:oratio/config/entities/project.dart';
import 'package:oratio/config/entities/student.dart';
import 'package:oratio/config/entities/teacher.dart';

class EditProjectModal extends StatefulWidget {
  final Project project;
  final Student student;
  final Teacher teacher;
  final List<Teacher> teachers;
  final Function onEditProject;

  const EditProjectModal({
    super.key,
    required this.project,
    required this.onEditProject,
    required this.teachers,
    required this.student,
    required this.teacher,
  });

  @override
  State<EditProjectModal> createState() => _EditProjectModalState();
}

class _EditProjectModalState extends State<EditProjectModal> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();
  Teacher? _teacher;

  @override
  void initState() {
    super.initState();

    _titleController.text = widget.project.title;
    _descriptionController.text = widget.project.description!;
    _linkController.text = widget.project.link!;
    _teacher = widget.teacher;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            if (_titleController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('O título não pode ser vazio'),
                ),
              );
              return;
            }
            widget.onEditProject(project);
            Navigator.pop(context);
          },
          child: const Text('Salvar'),
        ),
      ],
      content: Container(
        width: 500,
        height: 400,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Título'),
            TextField(
              controller: _titleController,
            ),
            const SizedBox(height: 20),
            const Text('Descrição'),
            TextField(
              controller: _descriptionController,
            ),
            const SizedBox(height: 20),
            const Text('Link (opcional)'),
            TextField(
              style: const TextStyle(color: Colors.blue),
              controller: _linkController,
            ),
            const SizedBox(height: 20),
            const Text('Professor'),
            _selectTeacherButton(),
          ],
        ),
      ),
    );
  }

  Project get project => Project(
        id: widget.project.id,
        studentId: widget.student.id!,
        title: _titleController.text,
        description: _descriptionController.text,
        link: _linkController.text,
        teacherId: _teacher!.id,
      );

  Widget _selectTeacherButton() {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Escolha o professor'),
                content: Container(
                  width: 500,
                  height: 400,
                  padding: const EdgeInsets.all(20),
                  child: ListView.builder(
                    itemCount: widget.teachers.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          setState(() {
                            _teacher = widget.teachers[index];
                          });
                          Navigator.pop(context);
                        },
                        title: Text(widget.teachers[index].name),
                      );
                    },
                  ),
                ),
              );
            });
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(10),
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_teacher?.name ?? 'Escolha o orientador'),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
