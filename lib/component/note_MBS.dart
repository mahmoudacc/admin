

import 'package:flutter/material.dart';
import 'package:tttt/page/scansreen/note_screen.dart';

commentMBS(BuildContext context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      // backgroundColor: Colors.white,
      barrierColor: Colors.black.withAlpha(1),
      backgroundColor: Colors.transparent,

      builder: (ctx) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: NoteScreen(),
        );
      });

}