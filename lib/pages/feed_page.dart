import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart'; // Added this import for ImagePicker
import 'package:flutter/foundation.dart';

final _postKey = GlobalKey<FormState>();

class MapPage extends StatelessWidget {
  final Uint8List? imageBytes;

  const MapPage({super.key, this.imageBytes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Page'), // Optional AppBar for better navigation
      ),
      body: const Center(
        child: FeedWidget(),
      ),
    );
  }
}

class FeedWidget extends StatefulWidget {
  const FeedWidget({super.key});

  @override
  _FeedWidgetState createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  String locationMessage = 'Current Location of User';
  final TextEditingController postController = TextEditingController();
  double? long;
  late bool isContainerVisible;
  Uint8List? _image;

  @override
  void initState() {
    super.initState();
    isContainerVisible = false;
  }

  void toggleContainerVisibility() {
    setState(() {
      isContainerVisible = !isContainerVisible;
      if (!isContainerVisible) {
        FocusScope.of(context).unfocus(); // Unfocus the keyboard when hiding the container
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 80.0,
          left: 20.0,
          right: 20.0,
          child: AnimatedOpacity(
            opacity: isContainerVisible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: IgnorePointer(
              ignoring: !isContainerVisible,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (_image != null)
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Image.memory(_image!),
                            // Delete button
                            Positioned(
                              top: 1,
                              right: 1,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.cancel,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _image = null;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    SingleChildScrollView(
                      child: Form(
                        key: _postKey,
                        child: TextFormField(
                          controller: postController,
                          maxLines: 2,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                            hintText: 'What is happening around you?',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            _pickImageFromGallery();
                          },
                          icon: const Icon(Icons.add_photo_alternate),
                          color: Colors.blue,
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            // Add your campaign-related logic here
                          },
                          icon: const Icon(Icons.campaign_outlined),
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black.withOpacity(0.9),
            ),
            child: Center( // Center the icon inside the circle
              child: IconButton(
                onPressed: toggleContainerVisibility,
                icon: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      setState(() {
        _image = imageBytes;
      });
    }
  }
}
