import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/glass_button.dart';
import '../widgets/glass_card.dart';
import '../widgets/confetti_success.dart';
import '../services/firebase_service.dart';
import '../models/bullying_report.dart';

/// Report Bullying screen with form
class ReportScreen extends ConsumerStatefulWidget {
  const ReportScreen({super.key});
  
  @override
  ConsumerState<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends ConsumerState<ReportScreen> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  final _firebaseService = FirebaseService();
  
  String? _selectedSchool;
  String? _selectedLocation;
  bool _isSubmitting = false;
  bool _showSuccess = false;
  
  final List<String> _schools = [
    'Lincoln High School',
    'Washington Middle School',
    'Roosevelt Elementary',
    'Jefferson High School',
    'Other',
  ];
  
  final List<String> _locations = [
    'School hallway',
    'Classroom',
    'Cafeteria',
    'Playground',
    'Online/Social media',
    'School bus',
    'Other',
  ];
  
  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }
  
  Future<void> _submitReport() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });
      
      final report = BullyingReport(
        description: _descriptionController.text.trim(),
        school: _selectedSchool,
        location: _selectedLocation,
        timestamp: DateTime.now(),
      );
      
      final success = await _firebaseService.submitReport(report);
      
      if (success && mounted) {
        setState(() {
          _isSubmitting = false;
          _showSuccess = true;
        });
        
        // Reset form after delay
        Future.delayed(const Duration(seconds: 3), () {
          if (mounted) {
            setState(() {
              _showSuccess = false;
              _descriptionController.clear();
              _selectedSchool = null;
              _selectedLocation = null;
            });
          }
        });
      } else if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to submit report. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.primaryGradient,
        ),
        child: SafeArea(
          bottom: false,
          child: ConfettiSuccess(
            trigger: _showSuccess,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back button
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(height: 16),
                    // Title
                    Text(
                      'Report Bullying',
                      style: AppTextStyles.h1,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Your voice matters. This report is anonymous and helps keep everyone safe.',
                      style: AppTextStyles.bodyMedium,
                    ),
                    const SizedBox(height: 32),
                    // Description field
                    GlassCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Describe what happened',
                            style: AppTextStyles.h3,
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _descriptionController,
                            maxLines: 6,
                            decoration: InputDecoration(
                              hintText: 'Tell us what happened...',
                              hintStyle: AppTextStyles.bodyMedium,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.3),
                            ),
                            style: AppTextStyles.bodyLarge,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please describe what happened';
                              }
                              if (value.trim().length < 10) {
                                return 'Please provide more details';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // School dropdown
                    GlassCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'School/Class (Optional)',
                            style: AppTextStyles.h3,
                          ),
                          const SizedBox(height: 12),
                          DropdownButtonFormField<String>(
                            initialValue: _selectedSchool,
                            decoration: InputDecoration(
                              hintText: 'Select school',
                              hintStyle: AppTextStyles.bodyMedium,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.3),
                            ),
                            items: _schools.map((school) {
                              return DropdownMenuItem(
                                value: school,
                                child: Text(school, style: AppTextStyles.bodyLarge),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedSchool = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Location dropdown
                    GlassCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Where did this happen?',
                            style: AppTextStyles.h3,
                          ),
                          const SizedBox(height: 12),
                          DropdownButtonFormField<String>(
                            initialValue: _selectedLocation,
                            decoration: InputDecoration(
                              hintText: 'Select location',
                              hintStyle: AppTextStyles.bodyMedium,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.3),
                            ),
                            items: _locations.map((location) {
                              return DropdownMenuItem(
                                value: location,
                                child: Text(location, style: AppTextStyles.bodyLarge),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedLocation = value;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a location';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Submit button
                    GlassButton(
                      text: _showSuccess ? 'Report Submitted!' : 'Submit Report',
                      icon: _showSuccess ? Icons.check_circle : Icons.send,
                      onPressed: _showSuccess ? null : _isSubmitting ? null : _submitReport,
                      width: double.infinity,
                    ),
                    if (_isSubmitting) ...[
                      const SizedBox(height: 16),
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                    if (_showSuccess) ...[
                      const SizedBox(height: 16),
                      GlassCard(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 32,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'Thank you for speaking up. Your report has been received anonymously.',
                                style: AppTextStyles.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 40,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

