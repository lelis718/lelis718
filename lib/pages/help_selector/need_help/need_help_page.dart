import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/handy_theme/handy_theme.dart';
import 'package:handyclientapp/models/models.dart';
import 'package:handyclientapp/pages/pages.dart';

class NeedHelpPage extends StatelessWidget {
  final VoidCallback onReturning;
  final Function(Help) onSubmit;
  final DeviceInfo deviceInfo;

  final _formKey = GlobalKey<FormState>();

  NeedHelpPage({this.deviceInfo, this.onReturning, this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What needs to be done?'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: onReturning,
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                key: Key('NeedHelpPage_RaisedButton_TextForm'),
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: 'I need help to do ....',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.pink,
                      style: BorderStyle.solid,
                      width: 10,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'We need to know what do you neeed';
                  }
                  onSubmit(Help(
                    message: value,
                    user: deviceInfo.uuid,
                  ));
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                      key: Key('NeedHelpPage_RaisedButton_Ask'),
                      color: Colors.blue,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Processing Data'),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Ask Help',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    RaisedButton(
                      key: Key('NeedHelpPage_RaisedButton_Back'),
                      color: Colors.blue,
                      onPressed: onReturning,
                      child: Text(
                        'Back',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
