import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

TextEditingController workoutNameController = TextEditingController();
final uid = FirebaseAuth.instance.currentUser?.uid;
Future<void> AddWorkoutDialog(BuildContext context, firstLoad) {
  return showDialog(
      barrierDismissible: firstLoad ?? true,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Center(
              child:
                  Text('Add Workout', style: TextStyle(color: Colors.white))),
          content: Column(mainAxisSize: MainAxisSize.min, children: [
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
            )
          ]),
        );
      });
}
