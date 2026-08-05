import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class FormattedMarkdownText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final Color? textColor;

  const FormattedMarkdownText({
    super.key,
    required this.data,
    this.style,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final baseStyle = style ?? theme.textTheme.bodyMedium ?? const TextStyle(fontSize: 15);
    final defaultColor = textColor ?? baseStyle.color ?? theme.colorScheme.onSurface;

    return MarkdownBody(
      data: data,
      selectable: true,
      styleSheet: MarkdownStyleSheet.fromTheme(theme).copyWith(
        p: baseStyle.copyWith(
          fontSize: 15,
          height: 1.45,
          color: defaultColor,
        ),
        strong: baseStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: defaultColor,
        ),
        em: baseStyle.copyWith(
          fontSize: 15,
          fontStyle: FontStyle.italic,
          color: defaultColor,
        ),
        h1: theme.textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.primary,
        ),
        h2: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.primary,
        ),
        h3: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.primary,
        ),
        listBullet: baseStyle.copyWith(
          fontSize: 15,
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
        code: TextStyle(
          fontFamily: 'monospace',
          fontSize: 13,
          backgroundColor: theme.colorScheme.surfaceContainerHighest,
          color: theme.colorScheme.primary,
        ),
        codeblockDecoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: theme.colorScheme.outlineVariant),
        ),
        blockquoteDecoration: BoxDecoration(
          color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(8),
          border: Border(
            left: BorderSide(color: theme.colorScheme.primary, width: 4),
          ),
        ),
      ),
    );
  }
}
