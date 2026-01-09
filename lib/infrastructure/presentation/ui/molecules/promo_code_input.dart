import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';

/// Promo code input widget with apply/remove functionality
class PromoCodeInput extends StatefulWidget {
  final String? appliedPromoCode;
  final double? discountAmount;
  final bool isLoading;
  final String? errorMessage;
  final Future<void> Function(String code) onApply;
  final VoidCallback? onRemove;

  const PromoCodeInput({
    super.key,
    this.appliedPromoCode,
    this.discountAmount,
    this.isLoading = false,
    this.errorMessage,
    required this.onApply,
    this.onRemove,
  });

  @override
  State<PromoCodeInput> createState() => _PromoCodeInputState();
}

class _PromoCodeInputState extends State<PromoCodeInput> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isProcessing = false;

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _handleApply() async {
    final code = _controller.text.trim();
    if (code.isEmpty) return;

    setState(() => _isProcessing = true);
    try {
      await widget.onApply(code);
      _controller.clear();
      _focusNode.unfocus();
    } catch (e) {
      // Error is handled by parent
    } finally {
      if (mounted) {
        setState(() => _isProcessing = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final hasAppliedCode = widget.appliedPromoCode != null;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? DarkAppColors.surfaceElevated1 : AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(
          color: widget.errorMessage != null
              ? AppColors.error500.withValues(alpha: 0.3)
              : Colors.white.withValues(alpha: 0.05),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Icon(
                Icons.local_offer_outlined,
                size: 20,
                color: isDark ? DarkAppColors.textSecondary : AppColors.neutral500,
              ),
              const SizedBox(width: 8),
              Text(
                'Promo Code',
                style: AppTypography.bodyMd.copyWith(
                  color: isDark ? DarkAppColors.textPrimary : AppColors.neutral900,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Applied promo code or input field
          if (hasAppliedCode)
            _buildAppliedCodeView(isDark)
          else
            _buildInputView(isDark),

          // Error message
          if (widget.errorMessage != null) ...[
            const SizedBox(height: 8),
            Text(
              widget.errorMessage!,
              style: AppTypography.bodyXs.copyWith(
                color: AppColors.error500,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInputView(bool isDark) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            enabled: !_isProcessing && !widget.isLoading,
            textCapitalization: TextCapitalization.characters,
            decoration: InputDecoration(
              hintText: 'Enter code',
              hintStyle: AppTypography.bodySm.copyWith(
                color: isDark ? DarkAppColors.textMuted : AppColors.neutral400,
              ),
              filled: true,
              fillColor: isDark ? DarkAppColors.surfaceElevated2 : AppColors.neutral50,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
            ),
            style: AppTypography.bodySm.copyWith(
              color: isDark ? DarkAppColors.textPrimary : AppColors.neutral900,
              fontWeight: FontWeight.w600,
            ),
            onSubmitted: (_) => _handleApply(),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          height: 40,
          child: ElevatedButton(
            onPressed: _isProcessing || widget.isLoading ? null : _handleApply,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary500,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
              elevation: 0,
            ),
            child: _isProcessing || widget.isLoading
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(
                    'Apply',
                    style: AppTypography.labelSm.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildAppliedCodeView(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.success500.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(
          color: AppColors.success500.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            size: 20,
            color: AppColors.success500,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.appliedPromoCode!.toUpperCase(),
                  style: AppTypography.bodySm.copyWith(
                    color: isDark ? DarkAppColors.textPrimary : AppColors.neutral900,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (widget.discountAmount != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    '-\$${widget.discountAmount!.toStringAsFixed(2)}',
                    style: AppTypography.bodyXs.copyWith(
                      color: AppColors.success600,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (widget.onRemove != null)
            IconButton(
              icon: const Icon(Icons.close, size: 20),
              onPressed: widget.onRemove,
              color: isDark ? DarkAppColors.textSecondary : AppColors.neutral500,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
        ],
      ),
    );
  }
}
