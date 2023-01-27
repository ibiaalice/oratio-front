import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oratio/screen/home/options/coordinator_options/coordinator_section_store.dart';
import 'package:oratio/screen/home/widgets/circle_pending_load.dart';
import 'package:oratio/utils/widgets/error_message_alert.dart';
import 'package:oratio/utils/widgets/success_message_alert.dart';

class ClosedSemesterOptionSection extends StatefulWidget {
  const ClosedSemesterOptionSection({super.key});

  @override
  State<ClosedSemesterOptionSection> createState() =>
      _ClosedSemesterOptionSectionState();
}

class _ClosedSemesterOptionSectionState
    extends State<ClosedSemesterOptionSection> {
  final store = CoordinatorSectionStore();

  @override
  void initState() {
    super.initState();
    store.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        height: 400,
        padding: const EdgeInsets.only(top: 80, right: 400, left: 130),
        child: (store.isLoading)
            ? const Center(child: CirclePendingLoad())
            : Card(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _advice(),
                      _confirmButton(),
                    ]),
              ),
      );
    });
  }

  Widget _confirmButton() => Center(
        child: TextButton(
          child: const Text(
            'CONFIRMAR',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () async {
            final result = await store.closeSemester();

            if (result.success) {
              return showDialog(
                context: context,
                builder: (context) => SuccessMessageAlert(
                  message: result.message,
                ),
              );
            } else {
              return showDialog(
                context: context,
                builder: (context) => ErrorMessageAlert(
                  message: result.message,
                ),
              );
            }
          },
        ),
      );

  Widget _advice() => const Padding(
        padding: EdgeInsets.symmetric(
          vertical: 50.0,
          horizontal: 50.0,
        ),
        child: Text(
          'Ao fechar o semestre, não será possível adicionar modificações de projetos e alunos.\n Por favor, verique se já houve todas as modificações necessárias para a conclusão do semestre atual\n e confirme com a finalização somente com a segurança de que não haverá modificações pendentes',
          style: TextStyle(fontSize: 20),
        ),
      );
}
