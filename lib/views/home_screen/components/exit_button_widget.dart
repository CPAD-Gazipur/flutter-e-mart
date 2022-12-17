import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_e_mart/consts/consts.dart';

Future<bool> exitButtonWidget({
  required BuildContext context,
}) async {
  return (await showDialog(
        context: context,
        builder: (context) => Platform.isIOS
            ? AlertDialog(
                title: const Text('Warning!'),
                content: const Text('Want to exit from E-Mart?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('No'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text('Yes'),
                  ),
                ],
              )
            : CupertinoAlertDialog(
                title: const Text('Warning!'),
                content: const Text('Want to exit from E-Mart?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('No'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text('Yes'),
                  ),
                ],
              ),
      )) ??
      false;
}
