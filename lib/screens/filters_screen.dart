import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/filters_provider.dart';




class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});


  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();

}



class _FiltersScreenState extends  ConsumerState<FiltersScreen> {
  bool _glutenFreeFilter = false;
  bool _lactoseFreeFilter = false;
  bool _veganFilter = false;
  bool _vegetarianFilter = false;
  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filtersProvider);
    _glutenFreeFilter = activeFilters[MealFilter.glutenfree]!;
    _lactoseFreeFilter = activeFilters[MealFilter.lactosefree]!;
    _veganFilter = activeFilters[MealFilter.vegan]!;
    _vegetarianFilter = activeFilters[MealFilter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),

      body: WillPopScope(
        onWillPop: ()async{
          ref.read(filtersProvider.notifier).setFilters({
            MealFilter.glutenfree: _glutenFreeFilter,
            MealFilter.lactosefree: _lactoseFreeFilter,
            MealFilter.vegan: _veganFilter,
            MealFilter.vegetarian: _vegetarianFilter,
          });
          return true;
        },
        child: Column(
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
