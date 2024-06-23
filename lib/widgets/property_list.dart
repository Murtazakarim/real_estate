

import 'package:flutter/material.dart';
import 'package:real_estate_app/generated/assets.dart';
import 'property_card.dart';
import '../models/property.dart';

class PropertyList extends StatefulWidget {
  @override
  _PropertyListState createState() => _PropertyListState();
}

class _PropertyListState extends State<PropertyList> {
  final List<Property> properties = [
    Property(
      id: '1',
      title: 'Luxury Villa',
      description: 'A beautiful villa in the heart of the city.',
      imageUrl: Assets.imagesBanner1,
      price: 1200000, latitude: 0.0, longitude: 0.000,
    ),
    Property(
      id: '2',
      title: 'Luxury Villa',
      description: 'A beautiful villa in the heart of the city.',
      imageUrl: Assets.imagesBanner1,
      price: 1200000, latitude: 0.0, longitude: 0.000,
    ),
    Property(
      id: '3',
      title: 'Luxury Villa',
      description: 'A beautiful villa in the heart of the city.',
      imageUrl: Assets.imagesBanner1,
      price: 1200000, latitude: 0.0, longitude: 0.000,
    ),
    Property(
      id: '4',
      title: 'Luxury Villa',
      description: 'A beautiful villa in the heart of the city.',
      imageUrl: Assets.imagesBanner1,
      price: 1200000, latitude: 0.0, longitude: 0.000,
    ),
    // Add more properties here
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: CustomScrollView(
        //physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: PropertyCard(property: properties[0]),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.8,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return PropertyCard(property: properties[index]); // Start from the second item
                },
                childCount: properties.length, // Adjust according to your item count
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 160), // Adjust the height as needed
          ),
        ],
      ),
    );
  }

  Widget _buildItem(Property property, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: PropertyCard(property: property),
    );
  }
}
