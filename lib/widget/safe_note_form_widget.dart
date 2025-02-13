import 'package:flutter/material.dart';

class NoteFormWidget extends StatelessWidget {
  final String? title;
  final String? description;
  final String? isArchive;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final FocusNode titleFocus;
  final FocusNode descriptionFocus;

  const NoteFormWidget({
    Key? key,
    this.title = '',
    this.description = '',
    this.isArchive = '',
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.titleFocus,
    required this.descriptionFocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitle(),
            SizedBox(height: 8),
            buildDescription(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget buildTitle() => TextFormField(
        maxLines: 2,
        initialValue: title,
        enableInteractiveSelection: true,
        autofocus: false,
        focusNode: titleFocus,
        toolbarOptions: ToolbarOptions(
          paste: true,
          cut: true,
          copy: true,
          selectAll: true,
        ),
        style: TextStyle(
          //color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Title',
          //hintStyle: TextStyle(color: Colors.white70),
        ),
        // validator: (title) =>
        //     title != null ? 'The title cannot be empty' : null,
        onChanged: onChangedTitle,
      );

  Widget buildDescription() {
    return TextFormField(
      maxLines: 30,
      initialValue: description,
      enableInteractiveSelection: true,
      autofocus: true,
      focusNode: descriptionFocus,
      toolbarOptions: ToolbarOptions(
        paste: true,
        copy: true,
        selectAll: true,
      ),
      style: TextStyle(/* color: Colors.white60, */ fontSize: 18),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Type something...',
        //hintStyle: TextStyle(color: Colors.white60),
      ),
      // validator: (title) => title != null && title.isEmpty
      //     ? 'The description cannot be empty'
      //     : null,
      onChanged: onChangedDescription,
    );
  }
}
