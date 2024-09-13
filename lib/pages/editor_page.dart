import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_font_picker/flutter_font_picker.dart';

class SpaceCreatorPage extends StatefulWidget {
  @override
  _SpaceCreatorPageState createState() => _SpaceCreatorPageState();
}

class _SpaceCreatorPageState extends State<SpaceCreatorPage> {
  List<Widget> texts = [];
  Color backgroundColor = Colors.white;
  TextEditingController textController = TextEditingController();
  PickerFont? _selectedFont; // Variable to hold the selected font

  void addCustomText() {
    setState(() {
      texts.add(
        ResizableDraggableText(
          text: textController.text.isEmpty ? 'Custom Text' : textController.text,
          style: _selectedFont?.toTextStyle() ?? TextStyle(fontSize: 20.0),
          onPositionChanged: (position) {
            setState(() {
              // Handle any position changes here.
            });
          },
          onSizeChanged: (size) {
            setState(() {
              // Handle text size changes here.
            });
          },
        ),
      );
    });
  }

  void changeBackgroundColor() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Pick a Color'),
          content: ColorPicker(
            pickerColor: backgroundColor,
            onColorChanged: (color) {
              setState(() {
                backgroundColor = color;
              });
            },
            showLabel: false,
            pickerAreaHeightPercent: 0.8,
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Select'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showAddTextPage() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: textController,
                decoration: InputDecoration(labelText: 'Enter text'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: pickFont, // Add font picker button
                child: Text('Pick Font'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  addCustomText(); // Add the text with selected font
                },
                child: Text('Add Text'),
              ),
            ],
          ),
        );
      },
    );
  }

  void pickFont() {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Make sure the height can be controlled
    builder: (context) {
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.8, // Adjust the height as needed
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: FontPicker(
                  onFontChanged: (PickerFont font) {
                    setState(() {
                      _selectedFont = font;
                      print("${font.fontFamily} with font weight ${font.fontWeight} and font style ${font.fontStyle}.");
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Select'),
              ),
            ],
          ),
        ),
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: Stack(
          children: texts,
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: showAddTextPage, // Updated function to show bottom sheet
            child: Icon(Icons.text_fields),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: changeBackgroundColor,
            child: Icon(Icons.color_lens),
          ),
        ],
      ),
    );
  }
}

class ResizableDraggableText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final ValueChanged<Offset> onPositionChanged;
  final ValueChanged<double> onSizeChanged;

  ResizableDraggableText({
    required this.text,
    required this.style,
    required this.onPositionChanged,
    required this.onSizeChanged,
  });

  @override
  _ResizableDraggableTextState createState() => _ResizableDraggableTextState();
}

class _ResizableDraggableTextState extends State<ResizableDraggableText> {
  Offset position = Offset(50, 50);
  double fontSize = 20.0;
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isSelected = !_isSelected;
          });
        },
        child: Stack(
          children: [
            Draggable(
              child: Container(
                decoration: _isSelected
                    ? BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                          width: 2,
                        ),
                      )
                    : null,
                child: Text(
                  widget.text,
                  style: widget.style.copyWith(fontSize: fontSize),
                ),
              ),
              feedback: Material(
                child: Container(
                  decoration: _isSelected
                      ? BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                            width: 2,
                          ),
                        )
                      : null,
                  child: Text(
                    widget.text,
                    style: widget.style.copyWith(fontSize: fontSize),
                  ),
                ),
              ),
              onDragEnd: (details) {
                setState(() {
                  position = details.offset;
                  widget.onPositionChanged(position);
                });
              },
              childWhenDragging: Container(),
            ),
            _buildHandle(),
          ],
        ),
      ),
    );
  }

  Widget _buildHandle() {
    return Positioned(
      right: 0,
      bottom: 0,
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            fontSize = (fontSize + details.delta.dy).clamp(10.0, 100.0);
            widget.onSizeChanged(fontSize);
          });
        },
        child: Container(
          width: 10,
          height: 10,
          color: Colors.blue,
          child: Center(
            child: Icon(
              Icons.drag_handle,
              size: 12,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
