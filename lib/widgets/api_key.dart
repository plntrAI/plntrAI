import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class ApiKeyWidget extends StatelessWidget {
  ApiKeyWidget({required this.onSubmitted, super.key});

  final ValueChanged onSubmitted;
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'To use the Gemini API, you\'ll need an API key. '
                  'If you don\'t already have one, '
                  'create a key in Google AI Studio.',
            ),
            const SizedBox(height: 8),
            Link(
              uri: Uri.https('makersuite.google.com', '/app/apikey'),
              target: LinkTarget.blank,
              builder: (context, followLink) => TextButton(
                onPressed: followLink,
                child: const Text('Get an API Key'),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration:
                    textFieldDecoration(context, 'Enter your API key'),
                    controller: _textController,
                    onSubmitted: (value) {
                      onSubmitted(value);
                    },
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    onSubmitted(_textController.value.text);
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

InputDecoration textFieldDecoration(BuildContext context, String hintText) =>
    InputDecoration(
      contentPadding: const EdgeInsets.all(15),
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );