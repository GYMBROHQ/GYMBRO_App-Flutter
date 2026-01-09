import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../config/theme/theme.dart';

/// OTP Input Group organism - 6 digit code input
class OtpInputGroup extends StatefulWidget {
  final int length;
  final ValueChanged<String>? onCompleted;
  final ValueChanged<String>? onChanged;
  final bool hasError;
  final bool autoFocus;

  const OtpInputGroup({
    super.key,
    this.length = 6,
    this.onCompleted,
    this.onChanged,
    this.hasError = false,
    this.autoFocus = true,
  });

  @override
  State<OtpInputGroup> createState() => _OtpInputGroupState();
}

class _OtpInputGroupState extends State<OtpInputGroup> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  String get _currentCode {
    return _controllers.map((c) => c.text).join();
  }

  void _onChanged(int index, String value) {
    if (value.length == 1) {
      // Move to next field
      if (index < widget.length - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        // Last field - unfocus and trigger completed
        _focusNodes[index].unfocus();
        if (_currentCode.length == widget.length) {
          widget.onCompleted?.call(_currentCode);
        }
      }
    }
    widget.onChanged?.call(_currentCode);
  }

  void _onKeyDown(int index, KeyEvent event) {
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace &&
        _controllers[index].text.isEmpty &&
        index > 0) {
      _controllers[index - 1].clear();
      _focusNodes[index - 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.length, (index) {
        final hasValue = _controllers[index].text.isNotEmpty;

        Color borderColor;
        if (widget.hasError) {
          borderColor = theme.colorScheme.error;
        } else if (hasValue) {
          borderColor = theme.colorScheme.primary;
        } else {
          borderColor = isDark ? DarkAppColors.borderDefault : AppColors.borderDefault;
        }

        return Padding(
          padding: EdgeInsets.only(
            right: index < widget.length - 1 ? AppSpacing.spacing2 : 0,
          ),
          child: KeyboardListener(
            focusNode: FocusNode(),
            onKeyEvent: (event) => _onKeyDown(index, event),
            child: Container(
              width: 52,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: AppBorderRadius.md,
                border: Border.all(
                  color: borderColor,
                  width: hasValue || widget.hasError ? 2 : 1,
                ),
                color: isDark ? DarkAppColors.surfaceElevated1 : AppColors.white,
              ),
              child: Center(
                child: TextField(
                  controller: _controllers[index],
                  focusNode: _focusNodes[index],
                  autofocus: widget.autoFocus && index == 0,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  onChanged: (value) => _onChanged(index, value),
                  style: AppTypography.h3.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                  decoration: const InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

/// Resend code button with countdown timer
class ResendCodeButton extends StatelessWidget {
  final VoidCallback? onResend;
  final int remainingSeconds;
  final bool isLoading;

  const ResendCodeButton({
    super.key,
    this.onResend,
    this.remainingSeconds = 0,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final canResend = remainingSeconds <= 0 && !isLoading;

    return SizedBox(
      width: double.infinity,
      height: AppButtonSizes.heightMd,
      child: TextButton(
        onPressed: canResend ? onResend : null,
        style: TextButton.styleFrom(
          backgroundColor: isDark
              ? DarkAppColors.surfaceElevated1
              : AppColors.neutral100,
          shape: RoundedRectangleBorder(
            borderRadius: AppBorderRadius.md,
          ),
        ),
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Resend Code',
                    style: AppTypography.labelMd.copyWith(
                      color: isDark
                          ? DarkAppColors.textPrimary
                          : AppColors.textPrimary,
                    ),
                  ),
                  if (remainingSeconds > 0) ...[
                    const SizedBox(width: AppSpacing.spacing2),
                    Text(
                      _formatTime(remainingSeconds),
                      style: AppTypography.labelMd.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ],
              ),
      ),
    );
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(1, '0')}:${secs.toString().padLeft(2, '0')}';
  }
}
