import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddHabitScreen extends StatefulWidget {
  const AddHabitScreen({super.key});

  @override
  _AddHabitScreenState createState() => _AddHabitScreenState();
}

// Static variables to hold habit data as fallback
class HabitData {
  static Map<String, String> selectedHabits = {};
  static Map<String, String> completedHabits = {};
}

class _AddHabitScreenState extends State<AddHabitScreen> {
  final TextEditingController _habitController = TextEditingController();
  Color selectedColor = Colors.amber; // Default color
  Map<String, String> selectedHabitsMap = {};
  Map<String, String> completedHabitsMap = {};
  final Map<String, Color> _habitColors = {
    'Amber': Colors.amber,
    'Red Accent': Colors.redAccent,
    'Light Blue': Colors.lightBlue,
    'Light Green': Colors.lightGreen,
    'Purple Accent': Colors.purpleAccent,
    'Orange': Colors.orange,
    'Teal': Colors.teal,
    'Deep Purple': Colors.deepPurple,
  };
  String selectedColorName = 'Amber'; // Default color name

  @override
  void initState() {
    super.initState();
    _loadHabits();
  }

  Future<void> _loadHabits() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // Load habits from both maps
      selectedHabitsMap = Map<String, String>.from(
          jsonDecode(prefs.getString('selectedHabitsMap') ?? '{}'));
      completedHabitsMap = Map<String, String>.from(
          jsonDecode(prefs.getString('completedHabitsMap') ?? '{}'));
    });
  }

  Future<void> _saveHabits() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      
      // Clear existing data first
      await prefs.remove('selectedHabitsMap');
      await prefs.remove('completedHabitsMap');
      
      String selectedJson = jsonEncode(selectedHabitsMap);
      String completedJson = jsonEncode(completedHabitsMap);
      
      print('Saving selectedHabitsMap: $selectedJson');
      print('Saving completedHabitsMap: $completedJson');
      
      bool success1 = await prefs.setString('selectedHabitsMap', selectedJson);
      bool success2 = await prefs.setString('completedHabitsMap', completedJson);
      
      print('Save results: selectedHabitsMap=$success1, completedHabitsMap=$success2');
      
      // Force commit changes
      await prefs.commit();
      
      // Double check by reading back
      String? readBack1 = prefs.getString('selectedHabitsMap');
      String? readBack2 = prefs.getString('completedHabitsMap');
      print('Read back - Selected: $readBack1');
      print('Read back - Completed: $readBack2');
      
    } catch (e) {
      print('Error saving habits: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Combine both maps for display, ensuring no duplicates
    Map<String, String> allHabitsMap = {...selectedHabitsMap, ...completedHabitsMap};

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        title: Text('Configure Habits'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _habitController,
              decoration: const InputDecoration(
                labelText: 'Habit Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Select Color:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: DropdownButton<String>(
                value: selectedColorName,
                isExpanded: true,
                underline: const SizedBox(),
                items: _habitColors.keys.map((String colorName) {
                  return DropdownMenuItem<String>(
                    value: colorName,
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _habitColors[colorName],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        colorName,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedColorName = newValue!;
                    selectedColor = _habitColors[selectedColorName]!;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_habitController.text.isNotEmpty) {
                  // Add the new habit to the selectedHabitsMap with the chosen color
                  String habitName = _habitController.text;
                  String colorHex = selectedColor.value.toRadixString(16).substring(2); // Remove FF prefix
                  selectedHabitsMap[habitName] = colorHex;
                  
                  // Also update static variables as fallback
                  HabitData.selectedHabits[habitName] = colorHex;
                  
                  print('Adding habit: $habitName with color: $colorHex');
                  print('Static data updated: ${HabitData.selectedHabits}');
                  
                  await _saveHabits();
                  
                  setState(() {
                    _habitController.clear();
                    selectedColorName = 'Amber'; // Reset to default
                    selectedColor = _habitColors[selectedColorName]!;
                  });
                  
                  print('Habit saved successfully: ${selectedHabitsMap.toString()}');
                  
                  // Verify it was saved
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  String? saved = prefs.getString('selectedHabitsMap');
                  print('Verified in storage: $saved');
                }
              },
              child: Text(
                'Add Habit',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: allHabitsMap.entries.map((entry) {
                  final habitName = entry.key;
                  final habitColor = _getColorFromHex(entry.value);
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: habitColor,
                    ),
                    title: Text(habitName),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          // Remove habit from both maps if it exists
                          selectedHabitsMap.remove(habitName);
                          completedHabitsMap.remove(habitName);
                          _saveHabits();
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor'; // Add opacity if not included.
    }
    return Color(int.parse('0x$hexColor'));
  }
}