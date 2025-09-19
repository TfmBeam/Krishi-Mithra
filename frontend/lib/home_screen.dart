import 'package:flutter/material.dart';
import 'api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _queryController = TextEditingController();
  String _response = '';
  bool _isLoading = false;

  Future<void> _submitQuery() async {
    if (_queryController.text.trim().isEmpty) return;

    setState(() {
      _isLoading = true;
      _response = '';
    });

    try {
      final result = await ApiService.sendQuery(
        query: _queryController.text.trim(),
      );
      
      setState(() {
        _response = result['answer'] ?? 'No response received';
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _response = 'Error: ${e.toString()}';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Decorative leaves background (using Flutter icons)
            Positioned(
              top: 20,
              left: 20,
              child: Icon(
                Icons.eco,
                color: Colors.green.withOpacity(0.3),
                size: 60,
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: Icon(
                Icons.eco,
                color: Colors.green.withOpacity(0.2),
                size: 40,
              ),
            ),
            
            // Main content
            Column(
              children: [
                // Green header with KRISHI MITHRA
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: const BoxDecoration(
                    color: Color(0xFF6B8E23), // Olive green
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'KRISHI MITHRA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
                
                // Top controls (profile + bell)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF6B8E23),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.notifications_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.person_outline,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Greeting text
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Text(
                        'നമസ്കാരം, ',
                        style: TextStyle(
                          color: Color(0xFF2E7D32),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'John',
                        style: TextStyle(
                          color: Color(0xFF81C784),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Input bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _queryController,
                            decoration: const InputDecoration(
                              hintText: 'Ask Krishi Mithra',
                              hintStyle: TextStyle(
                                color: Color(0xFF666666),
                                fontSize: 16,
                              ),
                              border: InputBorder.none,
                            ),
                            onSubmitted: (_) => _submitQuery(),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.photo_library_outlined,
                          color: Color(0xFF666666),
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.attach_file,
                          color: Color(0xFF666666),
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.mic,
                          color: Color(0xFF666666),
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Output area
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF9F9F9),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFFE0E0E0),
                          width: 1,
                        ),
                      ),
                      child: _isLoading
                          ? const Center(
                              child: Text(
                                'Generating answer…',
                                style: TextStyle(
                                  color: Color(0xFF666666),
                                  fontSize: 16,
                                ),
                              ),
                            )
                          : _response.isNotEmpty
                              ? SingleChildScrollView(
                                  child: Text(
                                    _response,
                                    style: const TextStyle(
                                      color: Color(0xFF333333),
                                      fontSize: 16,
                                      height: 1.5,
                                    ),
                                  ),
                                )
                              : const Center(
                                  child: Text(
                                    'Ask a question to get started',
                                    style: TextStyle(
                                      color: Color(0xFF999999),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Chat button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: _submitQuery,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF6B8E23),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.chat_bubble_outline,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 24),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
  }
}
