import 'package:flutter/material.dart';
import 'package:ui_widgets/widgets/buttons/cta_confirm_button.dart';
import 'package:go_router/go_router.dart';

class SubmitSuccessScreen extends StatelessWidget {
  const SubmitSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: const Text("Success")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0), // sides padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: screenHeight * 0.1), // 25% from top
            Text(
              "Your order has been submitted successfully 🎉",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),
            CTAConfirmButton(
              label: "Back to Products",
              onPressed: () {
                GoRouter.of(context)
                    .replace('/product'); // navigate to product screen
              },
              buttonStyle: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.primary),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 16),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
