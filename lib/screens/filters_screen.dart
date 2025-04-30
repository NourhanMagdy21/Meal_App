import 'package:flutter/material.dart';
import 'package:food_app/screens/tabs_screen.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFreeFilter = false;
  bool _lactoseFreeFilter = false;
  bool _veganFilter = false;
  bool _vegetarianFilter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      drawer: MainDrawer(onSelectScreen: (identifier) {
        Navigator.of(context).pop();
        if (identifier == 'meals') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (ctx) => const TabsScreen()),
          );
        }
      }),
      body: Column(
        children: [
          customSwitch(
            context,
            'Gluten-free',
            'Only include gluten-free meals.',
            _glutenFreeFilter,
                (bool value) {
              setState(() {
                _glutenFreeFilter = value;
              });
            },
          ),
          customSwitch(
            context,
            'Lactose-free',
            'Only include lactose-free meals.',
            _lactoseFreeFilter,
                (bool value) {
              setState(() {
                _lactoseFreeFilter = value;
              });
            },
          ),
          customSwitch(
            context,
            'Vegan',
            'Only include vegan meals.',
            _veganFilter,
                (bool value) {
              setState(() {
                _veganFilter = value;
              });
            },
          ),
          customSwitch(
            context,
            'Vegetarian',
            'Only include vegetarian meals.',
            _vegetarianFilter,
                (bool value) {
              setState(() {
                _vegetarianFilter = value;
              });
            },
          ),
        ],
      ),
    );
  }

  SwitchListTile customSwitch(
      BuildContext context,
      String title,
      String subTitle,
      bool filter,
      Function(bool newValue) onChange,
      ) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 30, right: 20),
      value: filter,
      onChanged: onChange,
    );
  }
}
