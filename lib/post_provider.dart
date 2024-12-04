import 'package:flutter/material.dart';
import 'api_service.dart';

class PostProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<dynamic> _posts = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<dynamic> get posts => _posts;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchPosts() async {
    _isLoading = true;
    notifyListeners();

    try {
      _posts = await _apiService.fetchPosts();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
      _posts = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
