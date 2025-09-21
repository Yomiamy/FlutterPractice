// This function calls a hypothetical external API that returns
// a collection of weather information for a given location on a given date.
// `location` is an object of the form { city: string, state: string }
Future<Map<String, Object?>> fetchWeather(LocationParams params, String date) async {
  // TODO(developer): Write a standard function that would call to an external weather API.

  // For demo purposes, this hypothetical response is hardcoded here in the expected format.
  final apiResponse = {
    'temperature': 38,
    'chancePrecipitation': '56%',
    'cloudConditions': 'partlyCloudy',
  };
  return apiResponse;
}

class LocationParams {
  final String city;
  final String state;

  LocationParams({
    required this.city,
    required this.state,
  });
}
