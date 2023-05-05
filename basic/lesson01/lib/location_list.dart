import 'package:flutter/material.dart';
import 'package:lesson01/location_detail.dart';
import 'package:lesson01/styles.dart';
import 'models/location.dart';

class LocationList extends StatelessWidget {
  final List<Location> locations;

  const LocationList(this.locations, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Locations',
          style: Styles.naviBarTitle,
        ),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: _listViewItemBuilder,
      ),
    );
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    return ListTile(
      contentPadding: const EdgeInsets.all(10.0),
      leading: _itemThambnail(locations[index]),
      title: _itemTitle(locations[index]),
      onTap: () => _navigateToLocationDetail(context, locations[index]),
    );
  }

  void _navigateToLocationDetail(BuildContext context, Location location) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationDetail(location),
      ),
    );
  }

  Widget _itemThambnail(Location location) {
    return Container(
      constraints: const BoxConstraints.tightFor(width: 100.0),
      child: Image.network(
        location.url!,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _itemTitle(Location location) {
    return Text(
      '${location.name}',
      style: Styles.textDefault,
    );
  }
}