import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget IconSreachUI() => Container(
      width: 38,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white.withOpacity(0.1),
      ),
      child: Icon(
        Icons.search,
        color: Colors.white.withOpacity(0.9),
        // weight: 20,
        size: 30,
      ),
    );

Widget TitleUI() => const Text(
      "Notes",
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );

Widget NoteItme() => Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 24.0,
          left: 16.0,
          bottom: 24.0,
          right: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: const Text(
                'Title Task',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Padding(
                padding: EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                child: Text(
                  'Descriptions Of Task',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.trash),
              ),
            ),
            const Text('20/2/2001'),
          ],
        ),
      ),
    );
