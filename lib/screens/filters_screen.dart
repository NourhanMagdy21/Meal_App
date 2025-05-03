import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/filters_provider.dart';




class FiltersScreen extends ConsumerWidget   {
  const FiltersScreen({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<MealFilter, bool> activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),

      body: Column(
          children: [
            customSwitch(
              context,
              'Gluten-free',
              'Only include gluten-free meals.',
              activeFilters[MealFilter.glutenfree]!,
                  (bool value) {
                ref.read(filtersProvider.notifier).setFilter(MealFilter.glutenfree, value);
              },
            ),
            customSwitch(
              context,
              'Lactose-free',
              'Only include lactose-free meals.',
              activeFilters[MealFilter.lactosefree]!,
                  (bool value) {
                    ref.read(filtersProvider.notifier).setFilter(MealFilter.lactosefree, value);

              },
            ),
            customSwitch(
              context,
              'Vegan',
              'Only include vegan meals.',
              activeFilters[MealFilter.vegan]!,
                  (bool value) {
                    ref.read(filtersProvider.notifier).setFilter(MealFilter.vegan, value);

                  },
            ),
            customSwitch(
              context,
              'Vegetarian',
              'Only include vegetarian meals.',
              activeFilters[MealFilter.vegetarian]!,
                  (bool value) {
                    ref.read(filtersProvider.notifier).setFilter(MealFilter.vegetarian, value);

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
