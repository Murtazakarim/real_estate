// lib/screens/property_detail_screen.dart

import 'package:flutter/material.dart';
import '../models/property.dart';

class PropertyDetailScreen extends StatefulWidget {
  final Property property;

  PropertyDetailScreen(this.property);

  @override
  _PropertyDetailScreenState createState() => _PropertyDetailScreenState();
}

class _PropertyDetailScreenState extends State<PropertyDetailScreen> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.property.title),
      ),
      body: Column(
        children: [
          Image.network(widget.property.imageUrl),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: EdgeInsets.all(_isExpanded ? 16.0 : 8.0),
                child: Text(
                  widget.property.description,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '\$${widget.property.price}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
