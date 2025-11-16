import 'package:flutter/material.dart';

class QuickActions extends StatelessWidget {
  final VoidCallback onOppPressedMethod;

  const QuickActions({super.key, required this.onOppPressedMethod});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 73,
          child: OppWidget(onOppPressed: onOppPressedMethod),
        ),
      ],
    );
  }
}

class OppWidget extends StatelessWidget {
  const OppWidget({super.key, required this.onOppPressed});

  final VoidCallback onOppPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onOppPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFEC4899),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.factory, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nom du Organisation ',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'description',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
          ],
        ),
      ),
    );
  }
}
