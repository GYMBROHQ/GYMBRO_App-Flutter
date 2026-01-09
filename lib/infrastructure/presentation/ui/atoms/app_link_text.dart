import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';

/// Link text atom - clickable inline text
class AppLinkText extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final TextStyle? style;
  final bool bold;

  const AppLinkText({
    super.key,
    required this.text,
    this.onTap,
    this.style,
    this.bold = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: (style ?? AppTypography.bodySm).copyWith(
          color: theme.colorScheme.primary,
          fontWeight: bold ? AppTypography.weightBold : AppTypography.weightMedium,
        ),
      ),
    );
  }
}

/// Rich text with inline links
class AppRichTextWithLinks extends StatelessWidget {
  final String text;
  final Map<String, VoidCallback> links;
  final TextStyle? style;
  final TextAlign textAlign;

  const AppRichTextWithLinks({
    super.key,
    required this.text,
    required this.links,
    this.style,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final baseStyle = style ??
        AppTypography.bodySm.copyWith(
          color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
        );
    final linkStyle = baseStyle.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: AppTypography.weightBold,
    );

    // Parse text and create spans
    final spans = <TextSpan>[];
    String remaining = text;

    while (remaining.isNotEmpty) {
      // Find the earliest link in the remaining text
      int earliestIndex = remaining.length;
      String? foundLink;

      for (final link in links.keys) {
        final index = remaining.indexOf(link);
        if (index != -1 && index < earliestIndex) {
          earliestIndex = index;
          foundLink = link;
        }
      }

      if (foundLink != null) {
        // Add text before the link
        if (earliestIndex > 0) {
          spans.add(TextSpan(
            text: remaining.substring(0, earliestIndex),
            style: baseStyle,
          ));
        }

        // Add the link
        spans.add(TextSpan(
          text: foundLink,
          style: linkStyle,
          recognizer: TapGestureRecognizer()..onTap = links[foundLink],
        ));

        remaining = remaining.substring(earliestIndex + foundLink.length);
      } else {
        // No more links, add remaining text
        spans.add(TextSpan(
          text: remaining,
          style: baseStyle,
        ));
        break;
      }
    }

    return RichText(
      textAlign: textAlign,
      text: TextSpan(children: spans),
    );
  }
}
