import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';

/// Checkbox field molecule - checkbox with rich text label
class CheckboxField extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final Widget label;
  final bool hasError;

  const CheckboxField({
    super.key,
    required this.value,
    this.onChanged,
    required this.label,
    this.hasError = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onChanged != null ? () => onChanged!(!value) : null,
      borderRadius: AppBorderRadius.sm,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.spacing1),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: value,
                onChanged: onChanged,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                side: hasError
                    ? BorderSide(color: theme.colorScheme.error, width: 2)
                    : null,
              ),
            ),
            const SizedBox(width: AppSpacing.spacing3),
            Expanded(child: label),
          ],
        ),
      ),
    );
  }
}
