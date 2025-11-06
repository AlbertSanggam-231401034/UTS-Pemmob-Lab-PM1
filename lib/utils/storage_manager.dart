import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class StorageManager {
  static const String _resultsKey = 'mbti_results';

  static Future<void> saveResult(Map<String, dynamic> result) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final results = await getResults();
      results.add(result);
      await prefs.setString(_resultsKey, jsonEncode(results));
      print('✅ Result saved successfully: ${result['mbtiType']}');
    } catch (e) {
      print('❌ Error saving result: $e');
    }
  }

  static Future<List<Map<String, dynamic>>> getResults() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final resultsJson = prefs.getString(_resultsKey);
      if (resultsJson != null) {
        final List<dynamic> resultsList = jsonDecode(resultsJson);
        return resultsList.cast<Map<String, dynamic>>();
      }
      return [];
    } catch (e) {
      print('❌ Error getting results: $e');
      return [];
    }
  }

  static Future<void> clearResults() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_resultsKey);
      print('✅ Results cleared successfully');
    } catch (e) {
      print('❌ Error clearing results: $e');
    }
  }

  static Future<int> getResultsCount() async {
    final results = await getResults();
    return results.length;
  }
}