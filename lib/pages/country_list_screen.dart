import 'package:flutter/material.dart';
import 'package:uts_mobile_programming_220010129/pages/add_country.dart';
import 'package:uts_mobile_programming_220010129/pages/country_item.dart';
import 'package:uts_mobile_programming_220010129/pages/edit_country.dart';
import '../models/country.dart';

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({super.key});

  @override
  _CountryListScreenState createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  // Daftar awal negara
  final List<Country> _countries = [
    Country(
      countryCode: 'ID',
      countryName: 'Indonesia',
      description: 'Negara kepulauan terbesar di Asia Tenggara.',
      flagImageUrl:
          'https://id-test-11.slatic.net/p/19779bd966d131bbe5b8ae2a7f8dcf1d.jpg',
    ),
    Country(
      countryCode: 'US',
      countryName: 'United States',
      description: 'Negara dengan ekonomi terbesar di dunia.',
      flagImageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/800px-Flag_of_the_United_States.svg.png',
    ),
  ];

  void _addCountry(Country country) {
    setState(() {
      _countries.add(country);
    });
  }

  void _editCountry(int index, Country updatedCountry) {
    setState(() {
      _countries[index] = updatedCountry;
    });
  }

  void _deleteCountry(int index) {
    setState(() {
      _countries.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country List'),
        backgroundColor: Colors.blueAccent,
      ),
      body: _countries.isEmpty
          ? const Center(child: Text('No countries added yet.'))
          : ListView.builder(
              itemCount: _countries.length,
              itemBuilder: (context, index) {
                return CountryItem(
                  country: _countries[index],
                  onEdit: () async {
                    final updatedCountry = await Navigator.push<Country>(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EditCountryScreen(country: _countries[index]),
                      ),
                    );
                    if (updatedCountry != null) {
                      _editCountry(index, updatedCountry);
                    }
                  },
                  onDelete: () => _deleteCountry(index),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newCountry = await Navigator.push<Country>(
            context,
            MaterialPageRoute(
              builder: (context) => const AddCountryScreen(),
            ),
          );
          if (newCountry != null) {
            _addCountry(newCountry);
          }
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
