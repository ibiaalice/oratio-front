import 'package:flutter/material.dart';
import 'package:oratio/config/core/account_type.dart';
import 'package:oratio/utils/style/oratio_colors.dart';

class TypeRadioList extends StatelessWidget {
  final AccountType activeType;
  final Function(AccountType) onChanged;

  const TypeRadioList({
    super.key,
    required this.activeType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const values = AccountType.values;

    return Column(children: [
      for (AccountType type in values)
        RadioListTile(
          activeColor: OratioColors.accent,
          title: Text(
            type.name,
            style: TextStyle(
              color: type == activeType
                  ? OratioColors.accent
                  : OratioColors.text,
            ),
          ),
          value: type,
          groupValue: activeType,
          onChanged: (value) => onChanged(value!),
        ),
    ]);
  }
}
