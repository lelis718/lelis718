import 'package:flutter/material.dart';

class RequestSuccessConfirmation extends StatelessWidget {
  final VoidCallback onClose;

  const RequestSuccessConfirmation({this.onClose});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog(
        title: new Text('Help posted with successfully'),
        content: new Text('Alert Dialog body'),
        actions: <Widget>[
          new FlatButton(
            key: Key('RequestSuccessConfirmation_AlertDialog'),
            child: new Text('Close'),
            onPressed: onClose,
          ),
        ],
      ),
    );
  }
}
