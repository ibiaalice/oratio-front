import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oratio/config/entities/student.dart';
import 'package:oratio/screen/home/widgets/student_profile/student_profile_store.dart';
import 'package:oratio/utils/style/oratio_colors.dart';

class StudentProfile extends StatefulWidget {
  final Student student;
  final VoidCallback onBack;

  const StudentProfile({
    super.key,
    required this.student,
    required this.onBack,
  });

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  final StudentProfileStore store = StudentProfileStore();

  @override
  void initState() {
    super.initState();
    store.onInit(widget.student);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Observer(builder: (_) {
      return SingleChildScrollView(
        child: Container(
          color: OratioColors.white,
          width: screenSize.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _titleProfile(title: 'Detalhes do aluno'),
              _detailsProfile(),
              _titleProfile(title: 'Projeto'),
              _titleProfile(title: 'Acompanhamentos'),
            ],
          ),
        ),
      );
    });
  }

  Widget _titleProfile({required String title}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(title,
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
    );
  }

  Widget _detailsProfile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nome: ${store.student!.name}',
              style: const TextStyle(fontSize: 16.0)),
          const SizedBox(height: 10.0),
          Text('Email: ${store.student!.email}',
              style: const TextStyle(fontSize: 16.0)),
          const SizedBox(height: 10.0),
          Text('Matrícula: ${store.student!.registrationCourseNumber}',
              style: const TextStyle(fontSize: 16.0)),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: OratioColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: widget.onBack,
            icon: const Icon(Icons.arrow_back),
          ),
          const Padding(
            padding:
                EdgeInsets.only(left: 40.0, top: 8.0, bottom: 8.0, right: 8.0),
            child: Text('Perfil do aluno', style: TextStyle(fontSize: 16.0)),
          ),
        ],
      ),
    );
  }
}
