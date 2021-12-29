import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'widgets.dart';

class EmailDialog extends StatelessWidget {
  final _toInputCotnroller = TextEditingController(text: userEmail);
  final _subjectInputCotnroller = TextEditingController();
  final _bodyInputCotnroller = TextEditingController();

  EmailDialog({Key? key}) : super(key: key);

  _handleCancel(context) {
    Navigator.of(context).pop();
  }

  _handleSend(context) {
    var dialogData = {
      "to": _toInputCotnroller.text,
      "subject": _subjectInputCotnroller.text,
      "body": _bodyInputCotnroller.text,
    };
    Navigator.pop(context, dialogData);
  }

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      child: Dialog(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: defaultPadding,
            horizontal: defaultPadding,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.9,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email To: $userFirstName $userLastName",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(
                        height: defaultSizing,
                      ),
                      Column(
                        children: [
                          InputTextField(
                            fieldName: "To",
                            controller: _toInputCotnroller,
                            enabled: false,
                          ),
                          const SizedBox(height: defaultSizing),
                          InputTextField(
                            fieldName: "Subject",
                            controller: _subjectInputCotnroller,
                          ),
                          const SizedBox(height: defaultSizing),
                          InputTextField(
                            fieldName: "Body",
                            controller: _bodyInputCotnroller,
                            maxLines: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultSizing),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AnimatedLink(
                        text: "Cancel",
                        onTap: () => _handleCancel(context),
                      ),
                      const SizedBox(width: defaultSizing),
                      AnimatedButton(
                        text: "Send",
                        onTap: () => _handleSend(context),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
