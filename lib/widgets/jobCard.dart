// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:demo/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../model/jobModel.dart';

class JobCard extends StatelessWidget {
  final JobModel job;

  const JobCard({required this.job, super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid || Platform.isIOS
        ? Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 20),
          child: Card(
            color: lightGreenColor,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Container(
              padding: EdgeInsets.only(top: 20),
              margin: const EdgeInsets.only(left: 5),
              decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(job.company,
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: lightGreenColor)),
                                SizedBox(width: 10),
                                if (job.isNew)
                                  Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: lightGreenColor,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text('NEW!', style: TextStyle(color: whiteColor)),
                                  ),
                                if (job.isFeatured)
                                  Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: blackShade,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text('FEATURED', style: TextStyle(color: whiteColor)),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(job.position, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Text('${job.postedAt} • ${job.contract} • ${job.location}'),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: [
                        Chip(
                            side: BorderSide.none,
                            backgroundColor: lightGreenColor.withOpacity(.15),
                            label: Text(job.role, style: TextStyle(color: lightGreenColor))),
                        Chip(
                            side: BorderSide.none,
                            backgroundColor: lightGreenColor.withOpacity(.15),
                            label: Text(job.level, style: TextStyle(color: lightGreenColor))),
                        ...job.languages.map((lang) => Chip(
                            side: BorderSide.none,
                            backgroundColor: lightGreenColor.withOpacity(.15),
                            label: Text(lang, style: TextStyle(color: lightGreenColor)))),
                        ...job.tools.map((tool) => Chip(
                            side: BorderSide.none,
                            backgroundColor: lightGreenColor.withOpacity(.15),
                            label: Text(tool, style: TextStyle(color: lightGreenColor)))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 35,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent, // Set background color to white
            ),
            child: SvgPicture.asset(
              job.logo,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    )
        : Card(
      color: lightGreenColor,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Container(
        padding: EdgeInsets.only(top: 20),
        margin: const EdgeInsets.only(left: 5),
        decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                job.logo,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(job.company,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: lightGreenColor)),
                        ),
                        SizedBox(width: 10),
                        if (job.isNew)
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: lightGreenColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text('NEW!', style: TextStyle(color: whiteColor)),
                          ),
                        if (job.isFeatured)
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: blackShade,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text('FEATURED', style: TextStyle(color: whiteColor)),
                          ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(job.position, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Spacer(),
                        Expanded(
                          child: Wrap(
                            spacing: 8.0,
                            runSpacing: 4.0,
                            children: [
                              Chip(
                                  side: BorderSide.none,
                                  backgroundColor: lightGreenColor.withOpacity(.15),
                                  label: Text(job.role, style: TextStyle(color: lightGreenColor))),
                              Chip(
                                  side: BorderSide.none,
                                  backgroundColor: lightGreenColor.withOpacity(.15),
                                  label: Text(job.level, style: TextStyle(color: lightGreenColor))),
                              ...job.languages.map((lang) => Chip(
                                  side: BorderSide.none,
                                  backgroundColor: lightGreenColor.withOpacity(.15),
                                  label: Text(lang, style: TextStyle(color: lightGreenColor)))),
                              ...job.tools.map((tool) => Chip(
                                  side: BorderSide.none,
                                  backgroundColor: lightGreenColor.withOpacity(.15),
                                  label: Text(tool, style: TextStyle(color: lightGreenColor)))),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text('${job.postedAt} • ${job.contract} • ${job.location}'),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

