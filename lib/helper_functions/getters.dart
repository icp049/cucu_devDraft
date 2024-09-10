// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:intl/intl.dart';

// void displayMessageToUser(String message, BuildContext context){
//   showDialog(context: context, builder: (context) => AlertDialog( 
//     title: Text(message),
//   ),
//   );
// }



// String? getCurrentUserDisplayName() {
//   User? user = FirebaseAuth.instance.currentUser;
//   return user?.displayName;
// }


// String formatDate(DateTime dateTime) {
//   final dateFormatter = DateFormat.yMMMd();
//   return dateFormatter.format(dateTime);
// }


// String formatTime(DateTime dateTime) {
//   final timeFormatter = DateFormat('HH:mm:ss');
//   return timeFormatter.format(dateTime);
// }