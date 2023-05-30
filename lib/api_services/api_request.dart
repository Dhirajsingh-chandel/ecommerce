import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiRequest {

 static Future<dynamic> postApiCall(String url, Map<String, dynamic> body) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };

    final encodedBody = json.encode(body);

    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: encodedBody);

      if (response.statusCode == 200) {
        log(response.body);
        return json.decode(response.body);
      } else {
        // Handle error response
        log(response.toString());
        throw Exception(
            'API call failed with status code: ${response.statusCode}');
      }
    } on http.ClientException catch (e) {
      // Handle internet connectivity error
      throw Exception('Internet connection error: $e');
    } catch (e) {
      // Handle other exceptions
      throw Exception('An error occurred: $e');
    }
  }

 static Future<dynamic> getApiCall(String url) async {
   final headers = <String, String>{
     'Content-Type': 'application/json',
   };

   try {
     final response =
     await http.get(Uri.parse(url), headers: headers);

     if (response.statusCode == 200) {
    //   log(response.body);
       return json.decode(response.body);
     } else {
       // Handle error response
       log(response.toString());
       throw Exception(
           'API call failed with status code: ${response.statusCode}');
     }
   } on http.ClientException catch (e) {
     // Handle internet connectivity error
     throw Exception('Internet connection error: $e');
   } catch (e) {
     // Handle other exceptions
     throw Exception('An error occurred: $e');
   }
 }
}
