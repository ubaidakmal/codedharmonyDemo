// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../model/jobModel.dart';
import '../model/jobProvider.dart';
import '../widgets/jobCard.dart';

class ListingPage extends StatefulWidget {
  const ListingPage({super.key});

  @override
  _ListingPageState createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  bool _isLoading = true;
  Set<String> _selectedLanguages = {};

  @override
  void initState() {
    super.initState();
    _loadJobs();
  }

  Future<void> _loadJobs() async {
    final jobProvider = Provider.of<JobProvider>(context, listen: false);
    await jobProvider.loadJobs();
    setState(() {
      _isLoading = false;
    });
  }

  void _filterJobs(Set<String> languages) {
    setState(() {
      _selectedLanguages = languages;
    });
  }

  void _showFilterDialog(BuildContext context, List<String> languages) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        Set<String> tempSelectedLanguages = Set.from(_selectedLanguages);

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Column(
              children: [
                AppBar(
                  title: Text('Filter Jobs'),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                        _filterJobs(tempSelectedLanguages);
                      },
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: languages.map((String language) {
                      return CheckboxListTile(
                        title: Text(language),
                        value: tempSelectedLanguages.contains(language),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value == true) {
                              tempSelectedLanguages.add(language);
                            } else {
                              tempSelectedLanguages.remove(language);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final jobProvider = Provider.of<JobProvider>(context);
    final jobs = jobProvider.jobs;
    final filteredJobs = _selectedLanguages.isEmpty
        ? jobs
        : jobs.where((job) => _selectedLanguages.any((language) => job.languages.contains(language))).toList();

    final languages = jobs
        .expand((job) => job.languages)
        .toSet()
        .toList()
      ..sort();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Listings'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(context, languages),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: filteredJobs.length,
        itemBuilder: (context, index) {
          final job = filteredJobs[index];
          return JobCard(job: job);
        },
      ),
    );
  }
}
