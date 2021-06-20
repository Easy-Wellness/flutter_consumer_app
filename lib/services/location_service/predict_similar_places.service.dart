import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:users/constants/env.dart';

import 'place_autocomplete_prediction.model.dart';

/// Google Place Autocomplete API returns up to 5 results
Future<List<PlaceAutocompletePrediction>> predictSimilarPlaces(
    String input) async {
  // TODO cache predictions for each input to not make a request if the user enters the same input
  if (input.length <= 2) return [];
  final placeAutocompleteAPI = Uri.https(
    'maps.googleapis.com',
    '/maps/api/place/autocomplete/json',
    {
      'key': googleMapsApiKey,
      'input': input,
      'components': 'country:vn',
    },
  );
  final response = await http.get(placeAutocompleteAPI);
  if (response.statusCode == 200) {
    final parsed = (json.decode(response.body)['predictions'] as List)
        .cast<Map<String, dynamic>>();
    return parsed
        .map<PlaceAutocompletePrediction>(
            (json) => PlaceAutocompletePrediction.fromJson(json))
        .toList();
  } else
    throw HttpException(
      'The place prediction service is unavailable',
      uri: placeAutocompleteAPI,
    );
}