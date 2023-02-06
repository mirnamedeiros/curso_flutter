import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/models/place.dart';
import 'package:great_places/utils/db_util.dart';
import 'package:great_places/utils/location_util.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  Future<void> loadPlaces() async {
    final dataList = await DbUtil.getData('places');
    _items = dataList
        .map(
          (item) => Place(
            id: item['id'],
            name: item['name'],
            location: PlaceLocation(
              address: item['address'],
              latitude: item['latitude'],
              longitude: item['longitude'],
            ),
            image: File(item['image']),
          ),
        )
        .toList();
    notifyListeners();
  }

  List<Place> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Place itemByIndex(int index) {
    return _items[index];
  }

  Future<void> addPlace(String name, File image, LatLng position) async {
    String address = await LocationUtil.getAdressFrom(position);

    final newPlace = Place(
      id: Random().nextDouble().toString(),
      name: name,
      location: PlaceLocation(
          address: address,
          latitude: position.latitude,
          longitude: position.longitude),
      image: image,
    );

    _items.add(newPlace);
    DbUtil.insert('places', {
      'id': newPlace.id,
      'name': newPlace.name,
      'image': newPlace.image!.path,
      'latitude': position.latitude,
      'longitude': position.longitude,
      'address': address,
    });
    notifyListeners();
  }
}
