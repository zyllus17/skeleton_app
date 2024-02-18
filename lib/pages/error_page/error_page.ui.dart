import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeleton_app/i18n/strings.g.dart';

class ErrorPage extends HookConsumerWidget {
  const ErrorPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Assets.icons.errorPageImage.image(width: 200),
              const SizedBox(height: 20.0),
              Text(
                t.error_page_text,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 30),
              ),
            ],
          )),
    );
  }
}
