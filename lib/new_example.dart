import 'package:app_lock_example/preferences.dart';
import 'package:flutter/material.dart';

import 'local_auth.dart';

class NewExample extends StatefulWidget {
  const NewExample({super.key});

  @override
  State<NewExample> createState() => _NewExampleState();
}

class _NewExampleState extends State<NewExample> {
  bool authenticate = false;
  bool appLockEnabled = false;
  final appLockManager = AppLockManager();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    final isEnabled = await appLockManager.isAppLockEnabled();
    setState(() {
      appLockEnabled = isEnabled;
    });

    if (appLockEnabled) {
      await LocalAuth.authenticate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Face ID'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*ElevatedButton(
              onPressed: () async {
                final authentication = await LocalAuth.authenticate();
                setState(() {
                  authenticate = authentication;
                });
              },
              child: Text(
                'Authenticate',
              ),
            ),*/
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('App Lock',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                ),),
                Switch(
                  value: appLockEnabled,
                  onChanged: (value) async {
                    setState(() {
                      appLockEnabled = value;
                    });
                    appLockManager.toggleAppLock(value);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
