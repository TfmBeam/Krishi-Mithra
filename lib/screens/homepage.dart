import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'notifications_page.dart';
import 'profile_page.dart';
import 'voice_recording_page.dart';
import 'feedback_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _queryController = TextEditingController();
  final String userName = "John"; // This should come from user authentication

  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // Handle image processing here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image selected: ${image.name}')),
      );
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // Handle file processing here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('File selected: ${result.files.first.name}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4A7C59), // Olive green
              Color(0xFF6B8E6B), // Lighter green
              Color(0xFF8FBC8F), // Even lighter green
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // App Bar
              Container(
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFF4A7C59), // Olive green
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 20),
                    const Text(
                      'KRISHI MITHRA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NotificationsPage(),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.notifications_outlined,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfilePage(),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.person_outline,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ],
                ),
              ),
              
              // Main Content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      
                      // Greeting Section
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'നമസ്കാരം, ',
                                style: TextStyle(
                                  color: Colors.green[700],
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: userName,
                                style: TextStyle(
                                  color: Colors.green[600],
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 30),
                      
                      // Input Bar
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _queryController,
                                decoration: const InputDecoration(
                                  hintText: 'Ask Krishi Mithra',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: _pickImage,
                              icon: const Icon(
                                Icons.image_outlined,
                                color: Colors.grey,
                                size: 24,
                              ),
                            ),
                            IconButton(
                              onPressed: _pickFile,
                              icon: const Icon(
                                Icons.attach_file_outlined,
                                color: Colors.grey,
                                size: 24,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const VoiceRecordingPage(),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.mic_outlined,
                                color: Colors.grey,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      const Spacer(),
                      
                      // Feedback Button
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: FloatingActionButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FeedbackPage(),
                              ),
                            );
                          },
                          backgroundColor: const Color(0xFF4A7C59),
                          child: const Icon(
                            Icons.chat_bubble_outline,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
